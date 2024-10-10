import 'dart:math';

import 'package:cft/common/common_app_bar.dart';
import 'package:cft/common/input_num_widget.dart';
import 'package:cft/immediate_memory/immediate_memory_log.dart';
import 'package:cft/immediate_memory/immediate_memory_log_provider.dart';
import 'package:cft/immediate_memory/immediate_memory_problem.dart';
import 'package:cft/semantic_understanding.dart/semantic_understanding_for_meaning_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/v6.dart';

class ImmediateMemoryPage extends ConsumerStatefulWidget {
  const ImmediateMemoryPage({super.key, required this.nextPath});

  final String? nextPath;

  static const path = '/immediate_memory';

  @override
  ConsumerState<ImmediateMemoryPage> createState() =>
      _ImmediateMemoryPageState();
}

class _ImmediateMemoryPageState extends ConsumerState<ImmediateMemoryPage> {
  final controller = TextEditingController();

  var immediateMemoryProblem = ImmediateMemoryProblem.generate();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  var isDisplayMode = true;

  var isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: Center(
        child: SingleChildScrollView(
          child: !isPlaying
              ? Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '数字を覚えるゲーム',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          isPlaying = true;
                          immediateMemoryProblem =
                              immediateMemoryProblem.copyWith(
                            startedAt: DateTime.now(),
                          );
                        });
                      },
                      child: const Text('スタート'),
                    ),
                  ],
                )
              : isDisplayMode
                  ? Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'この数字を覚えてください。',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Gap(16),
                        Text(
                          immediateMemoryProblem.randomNumbers[
                              immediateMemoryProblem.userAnswerNumbers.length],
                          style: const TextStyle(
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        TimerWidget(
                          onEnd: () {
                            setState(() {
                              isDisplayMode = false;
                            });
                          },
                          duration: const Duration(seconds: 5),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        /// 今の問題数
                        Text(
                          '${immediateMemoryProblem.userAnswerNumbers.length + 1} / ${immediateMemoryProblem.randomNumbers.length}問',
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const Gap(16),
                        SizedBox(
                          width: 160,
                          child: TextFormField(
                            textAlign: TextAlign.right,
                            controller: controller,
                            readOnly: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ),
                        ),
                        InputNumWidget(
                          controller: controller,
                          onSubmitted: () async {
                            immediateMemoryProblem =
                                immediateMemoryProblem.copyWith(
                              userAnswerNumbers: [
                                ...immediateMemoryProblem.userAnswerNumbers,
                                controller.text,
                              ],
                            );
                            controller.clear();

                            /// 全問終了
                            if (immediateMemoryProblem
                                    .userAnswerNumbers.length ==
                                immediateMemoryProblem.randomNumbers.length) {
                              immediateMemoryProblem =
                                  immediateMemoryProblem.copyWith(
                                endAt: DateTime.now(),
                              );

                              final uid =
                                  FirebaseAuth.instance.currentUser!.uid;

                              await ref.read(immediateMemoryLogReference).add(
                                    ImmediateMemoryLog(
                                      id: const UuidV6().generate(),
                                      userId: uid,
                                      immediateMemoryProblem:
                                          immediateMemoryProblem,
                                    ),
                                  );
                              await showDialog<void>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: const Text('お疲れ様でした!'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: widget.nextPath == null
                                            ? const Text('再挑戦')
                                            : const Text('次のゲーム'),
                                      ),
                                    ],
                                  );
                                },
                              );

                              if (widget.nextPath != null) {
                                if (!context.mounted) {
                                  return;
                                }
                                context.go(
                                    '${widget.nextPath!}?nextPath=${SemanticUnderstandingForMeaningPage.path}');
                                return;
                              }

                              immediateMemoryProblem =
                                  ImmediateMemoryProblem.generate();
                              isPlaying = false;
                            }
                            isDisplayMode = true;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
        ),
      ),
    );
  }
}

class TimerWidget extends ConsumerStatefulWidget {
  const TimerWidget({
    super.key,
    required this.duration,
    this.startedAt,
    this.onEnd,
  });

  final Duration duration;
  final DateTime? startedAt;
  final void Function()? onEnd;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  late var startedAt = widget.startedAt ?? DateTime.now();
  Duration get duration => widget.duration;

  Duration get remainingTime =>
      startedAt.add(duration).difference(DateTime.now());

  Future<void> start() async {
    while (!remainingTime.isNegative) {
      setState(() {});
      await Future.delayed(const Duration(milliseconds: 1000 ~/ 60));
    }
    setState(() {});
    widget.onEnd?.call();
  }

  @override
  void initState() {
    super.initState();
    start();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          width: 160,
          height: 32,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 160,
                height: 16,
                color: Colors.black,
              ),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  width: 160 *
                      max(
                          0,
                          (remainingTime.inMilliseconds) /
                              duration.inMilliseconds),
                  height: 16,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        const Gap(8),
        Text(
          '${remainingTime.inSeconds + 1}',
        ),
      ],
    );
  }
}
