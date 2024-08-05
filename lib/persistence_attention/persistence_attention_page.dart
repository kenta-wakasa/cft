import 'package:auto_route/auto_route.dart';
import 'package:cft/persistence_attention/persistence_attention_notifier.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class PersistenceAttentionPage extends ConsumerWidget {
  const PersistenceAttentionPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
          const PlayingWidget(),
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
              color: Colors.black.withOpacity(0.6),
              alignment: Alignment.bottomCenter,
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
            )
        ],
      ),
    );
  }
}

class PlayingWidget extends ConsumerStatefulWidget {
  const PlayingWidget({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayingWidgetState();
}

class _PlayingWidgetState extends ConsumerState<PlayingWidget> {
  final controller = TextEditingController();

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
