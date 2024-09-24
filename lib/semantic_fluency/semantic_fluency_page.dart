import 'package:auto_route/auto_route.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class SemanticFluencyPage extends ConsumerStatefulWidget {
  const SemanticFluencyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticFluencyPageState();
}

class _SemanticFluencyPageState extends ConsumerState<SemanticFluencyPage> {
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
                        context.router.replace(
                          const HomeRoute(),
                        );
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
    );
  }
}
