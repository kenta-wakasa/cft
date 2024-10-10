import 'dart:async';

import 'package:cft/common/common_app_bar.dart';
import 'package:cft/common/input_num_widget.dart';
import 'package:cft/persistence_attention/persistence_attention_notifier.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class PersistenceAttentionPage extends ConsumerStatefulWidget {
  const PersistenceAttentionPage({
    super.key,
    required this.nextPath,
  });

  final String? nextPath;

  static const path = '/persistence_attention';

  @override
  ConsumerState<PersistenceAttentionPage> createState() =>
      _PersistenceAttentionPageState();
}

class _PersistenceAttentionPageState
    extends ConsumerState<PersistenceAttentionPage> {
  final controller = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(persistenceAttentionNotifierProvider);

    return Scaffold(
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: Stack(
        children: [
          PlayingWidget(
            controller: controller,
          ),
          if (!state.isPlaying && state.countDownTime > 0)
            Container(
              color: Colors.white.withOpacity(0.5),
              child: Center(
                child: Text(
                  '${state.countDownTime}',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge
                      ?.copyWith(fontSize: 80),
                ),
              ),
            ),
          if (!state.isPlaying && state.countDownTime == 0)
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              alignment: Alignment.center,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Text(
                      '単純な計算をやり続けるゲーム',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    ElevatedButton(
                      child: const Text('スタート'),
                      onPressed: () {
                        ref
                            .read(persistenceAttentionNotifierProvider.notifier)
                            .start();
                      },
                    ),
                  ],
                ),
              ),
            ),
          if (state.isTimeUp)
            Container(
              color: Colors.white.withOpacity(0.8),
              alignment: Alignment.center,
              child: Center(
                child: SizedBox(
                  width: 120,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      /// Tableで不正解、正回数、正答率を表示

                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       '不正解:',
                      //       style: Theme.of(context).textTheme.bodyLarge,
                      //     ),
                      //     Text(
                      //       '${state.problems.where((e) => e.userAnswer != null).where((e) => !e.isCorrect).length}',
                      //       style: Theme.of(context).textTheme.bodyLarge,
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       '正解: ',
                      //       style: Theme.of(context).textTheme.bodyLarge,
                      //     ),
                      //     Text(
                      //       '${state.problems.where((e) => e.userAnswer != null).where((e) => e.isCorrect).length}',
                      //       style: Theme.of(context).textTheme.bodyLarge,
                      //     ),
                      //   ],
                      // ),
                      // Row(
                      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //   children: [
                      //     Text(
                      //       '正答率:',
                      //       style: Theme.of(context).textTheme.bodyLarge,
                      //     ),
                      //     Text(
                      //       '${(state.problems.where((e) => e.userAnswer != null).where((e) => e.isCorrect).length / state.problems.where((e) => e.userAnswer != null).length * 1000).round() * 0.1}%',
                      //       style: Theme.of(context).textTheme.bodyLarge,
                      //     ),
                      //   ],
                      // ),
                      // const Gap(32),

                      if (widget.nextPath == null)
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              ref
                                  .read(persistenceAttentionNotifierProvider
                                      .notifier)
                                  .start();
                              controller.clear();
                            },
                            child: const Text('再挑戦'),
                          ),
                        )
                      else
                        Center(
                          child: ElevatedButton(
                            onPressed: () {
                              context.go(
                                  '${widget.nextPath!}?nextPath=${SelectAttentionPage.path}');
                            },
                            child: const Text('次のゲーム'),
                          ),
                        )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class PlayingWidget extends ConsumerStatefulWidget {
  const PlayingWidget({super.key, required this.controller});
  final TextEditingController controller;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayingWidgetState();
}

class _PlayingWidgetState extends ConsumerState<PlayingWidget> {
  TextEditingController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(persistenceAttentionNotifierProvider);
    final notifier = ref.read(persistenceAttentionNotifierProvider.notifier);
    final currentProblem = state.problems.last;

    const numberTextStyle = TextStyle(fontSize: 48);

    return Center(
      child: SingleChildScrollView(
        child: Column(
          children: [
            /// 回答の列挙
            // SizedBox(
            //   height: 75,
            //   width: 250,
            //   child: SingleChildScrollView(
            //     reverse: true,
            //     child: Wrap(
            //       children: [
            //         for (final problem in state.problems)
            //           SizedBox(
            //             width: 50,
            //             height: 50,
            //             child: Stack(
            //               alignment: Alignment.center,
            //               children: [
            //                 if (problem.userAnswer != null)
            //                   Text('${problem.userAnswer}'),
            //                 Text(
            //                   problem.userAnswer == null
            //                       ? '?'
            //                       : problem.userAnswer == problem.answer
            //                           ? '○'
            //                           : '×',
            //                   style: Theme.of(context).textTheme.titleLarge,
            //                 ),
            //               ],
            //             ),
            //           ),
            //       ],
            //     ),
            //   ),
            // ),

            /// タイマー
            if (state.isPlaying)
              const TimerWidget()
            else
              Text(
                '1:00',
                style: Theme.of(context).textTheme.titleLarge,
              ),

            /// 問題の表示
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 48,
                  child: Center(
                    child: Text(
                      !state.isPlaying ? '?' : '${currentProblem.a}',
                      style: numberTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  child: Center(
                    child: Text(
                      !state.isPlaying
                          ? '?'
                          : currentProblem.randomOperator.toSymbol,
                      style: numberTextStyle,
                    ),
                  ),
                ),
                SizedBox(
                  width: 48,
                  child: Center(
                    child: Text(
                      !state.isPlaying ? '?' : '${currentProblem.b}',
                      style: numberTextStyle,
                    ),
                  ),
                ),
                const Text(
                  '=',
                  style: numberTextStyle,
                ),
                const SizedBox(width: 8),
                SizedBox(
                  width: 64,
                  height: 80,
                  child: TextFormField(
                    textAlign: TextAlign.right,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      counterText: '',
                      counter: SizedBox.shrink(),
                      counterStyle: TextStyle(fontSize: 0),
                    ),
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    style: const TextStyle(fontSize: 32),
                    maxLength: 2,
                    controller: controller,
                    readOnly: true,
                  ),
                )
              ],
            ),
            InputNumWidget(
              controller: controller,
              onSubmitted: () {
                notifier.setUserAnswer(int.parse(controller.text));
                notifier.nextProblem();
                controller.clear();
              },
            ),
          ],
        ),
      ),
    );
  }
}

class TimerWidget extends ConsumerStatefulWidget {
  const TimerWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _TimerWidgetState();
}

class _TimerWidgetState extends ConsumerState<TimerWidget> {
  var elapsed = Duration.zero;
  Future<void> timer() async {
    while (true && context.mounted) {
      await Future.delayed(const Duration(milliseconds: 1000 ~/ 60));
      if (!context.mounted) {
        return;
      }
      final state = ref.read(persistenceAttentionNotifierProvider);
      final now = DateTime.now();
      elapsed = (state.startedAt ?? now)
          .add(const Duration(seconds: 60))
          .difference(now);
      if (elapsed.isNegative) {
        ref.read(persistenceAttentionNotifierProvider.notifier).timeUp();
        break;
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      '${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}',
      style: Theme.of(context).textTheme.titleLarge,
    );
  }
}
