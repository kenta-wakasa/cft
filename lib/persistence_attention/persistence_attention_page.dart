import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cft/persistence_attention/persistence_attention_notifier.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class PersistenceAttentionPage extends ConsumerStatefulWidget {
  const PersistenceAttentionPage({super.key});

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
              color: Colors.black.withOpacity(0.8),
              alignment: Alignment.center,
              child: Center(
                child: ElevatedButton(
                  child: const Text('スタート'),
                  onPressed: () {
                    ref
                        .read(persistenceAttentionNotifierProvider.notifier)
                        .start();
                  },
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

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '不正解:',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${state.problems.where((e) => e.userAnswer != null).where((e) => !e.isCorrect).length}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '正解: ',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${state.problems.where((e) => e.userAnswer != null).where((e) => e.isCorrect).length}',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '正答率:',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                          Text(
                            '${(state.problems.where((e) => e.userAnswer != null).where((e) => e.isCorrect).length / state.problems.where((e) => e.userAnswer != null).length * 1000).round() * 0.1}%',
                            style: Theme.of(context).textTheme.bodyLarge,
                          ),
                        ],
                      ),
                      const Gap(32),

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
                      ),
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
            SizedBox(
              height: 75,
              width: 250,
              child: SingleChildScrollView(
                reverse: true,
                child: Wrap(
                  children: [
                    for (final problem in state.problems)
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: Stack(
                          alignment: Alignment.center,
                          children: [
                            if (problem.userAnswer != null)
                              Text('${problem.userAnswer}'),
                            Text(
                              problem.userAnswer == null
                                  ? '?'
                                  : problem.userAnswer == problem.answer
                                      ? '○'
                                      : '×',
                              style: Theme.of(context).textTheme.titleLarge,
                            ),
                          ],
                        ),
                      ),
                  ],
                ),
              ),
            ),

            /// タイマー
            if (state.isPlaying)
              const TimerWidget()
            else
              Text(
                '0:10',
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
            Column(
              children: [
                for (final x in [0, 1, 2])
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      for (final y in [1 + (3 * x), 2 + (3 * x), 3 + (3 * x)])
                        SizedBox(
                          width: 64,
                          height: 64,
                          child: InkWell(
                            onTap: () {
                              controller.text = '${controller.text}$y';
                              setState(() {});
                            },
                            child: Center(
                              child: Text(
                                '$y',
                                style: const TextStyle(fontSize: 32),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 64,
                      height: 64,
                      child: InkWell(
                        onTap: () {
                          controller.text = '${controller.text}0';
                          setState(() {});
                        },
                        child: const Center(
                          child: Text(
                            '0',
                            style: TextStyle(fontSize: 32),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 64 * 3,
                  child: Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            controller.clear();
                          },
                          child: const Text(
                            '消去',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: () {
                            notifier.setUserAnswer(int.parse(controller.text));
                            notifier.nextProblem();
                            controller.clear();
                          },
                          child: const Text(
                            '決定',
                            style: TextStyle(fontSize: 10),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
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
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1000 ~/ 60));
      final state = ref.read(persistenceAttentionNotifierProvider);
      final now = DateTime.now();
      elapsed = (state.startedAt ?? now)
          .add(const Duration(seconds: 10))
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
