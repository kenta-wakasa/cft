import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:cft/common/input_num_widget.dart';
import 'package:cft/immediate_memory/immediate_memory_problem.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class ImmediateMemoryPage extends ConsumerStatefulWidget {
  const ImmediateMemoryPage({super.key});

  @override
  ConsumerState<ImmediateMemoryPage> createState() =>
      _ImmediateMemoryPageState();
}

class _ImmediateMemoryPageState extends ConsumerState<ImmediateMemoryPage> {
  final controller = TextEditingController();

  var immediateMemoryProblem = ImmediateMemoryProblem.generate(3);

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
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            showDialog<void>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: const Text('ホームに戻りますか？'),
                  actions: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text('キャンセル'),
                    ),
                    TextButton(
                      onPressed: () {
                        context.router.replace(const HomeRoute());
                      },
                      child: const Text('戻る'),
                    ),
                  ],
                );
              },
            );
          },
          icon: const Icon(Icons.home),
        ),
      ),
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
                            if (immediateMemoryProblem
                                    .userAnswerNumbers.length ==
                                immediateMemoryProblem.randomNumbers.length) {
                              await showDialog<void>(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text('結果'),
                                    content: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        for (var index = 0;
                                            index <
                                                immediateMemoryProblem
                                                    .randomNumbers.length;
                                            index++)
                                          Row(
                                            children: [
                                              Text('問題${index + 1}：'),
                                              SizedBox(
                                                width: 64,
                                                child: Text(
                                                    immediateMemoryProblem
                                                        .randomNumbers[index]),
                                              ),
                                              const Gap(8),
                                              const Text('回答：'),
                                              SizedBox(
                                                width: 64,
                                                child: Text(
                                                    immediateMemoryProblem
                                                            .userAnswerNumbers[
                                                        index]),
                                              ),
                                              const Gap(8),
                                              Text(
                                                immediateMemoryProblem
                                                                .randomNumbers[
                                                            index] ==
                                                        immediateMemoryProblem
                                                                .userAnswerNumbers[
                                                            index]
                                                    ? '正解'
                                                    : '不正解',
                                              ),
                                            ],
                                          ),

                                        /// 正解数

                                        Text(
                                          '正解数：${immediateMemoryProblem.correctAnswerCount}',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),

                                        /// 正解率
                                        Text(
                                          '正解率：${(immediateMemoryProblem.correctAnswerCount / immediateMemoryProblem.randomNumbers.length * 100).toStringAsFixed(1)}%',
                                          style: const TextStyle(
                                            fontSize: 16,
                                          ),
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: const Text('再挑戦'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              immediateMemoryProblem =
                                  ImmediateMemoryProblem.generate(3);
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
