import 'package:auto_route/auto_route.dart';
import 'package:cft/persistence_attention/persistence_attention_notifier.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

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
            showDialog(
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
      body: state.isPlaying ? const PlayingWidget() : const _StartWidget(),
    );
  }
}

class _StartWidget extends ConsumerWidget {
  const _StartWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(persistenceAttentionNotifierProvider);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '持続性注意',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const Gap(8),
          const Text('ランダムな数字の四則演算'),
          const Gap(24),
          ElevatedButton(
            onPressed: () {
              ref.read(persistenceAttentionNotifierProvider.notifier).start();
            },
            child: const Text('スタート'),
          ),
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
  final focusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    focusNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(persistenceAttentionNotifierProvider);
    final notifier = ref.read(persistenceAttentionNotifierProvider.notifier);
    final currentProblem = state.problems.last;

    const numberTextStyle = TextStyle(fontSize: 64);

    return Center(
      child: Column(
        children: [
          /// 回答の列挙
          SizedBox(
            height: 250,
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
                width: 64,
                child: Center(
                  child: Text(
                    '${currentProblem.a}',
                    style: numberTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 64,
                child: Center(
                  child: Text(
                    currentProblem.randomOperator.toSymbol,
                    style: numberTextStyle,
                  ),
                ),
              ),
              SizedBox(
                width: 64,
                child: Center(
                  child: Text(
                    '${currentProblem.b}',
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
                  autofocus: true,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    counterText: '',
                    counter: SizedBox.shrink(),
                    counterStyle: TextStyle(fontSize: 0),
                  ),
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                  style: const TextStyle(fontSize: 32),
                  focusNode: focusNode,
                  maxLength: 2,
                  controller: controller,
                  onFieldSubmitted: (text) {
                    controller.clear();
                    notifier.setUserAnswer(int.parse(text));
                    notifier.nextProblem();
                    focusNode.requestFocus();
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
