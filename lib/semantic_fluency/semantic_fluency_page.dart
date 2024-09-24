import 'package:auto_route/auto_route.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

@RoutePage()
class SemanticFluencyPage extends ConsumerStatefulWidget {
  const SemanticFluencyPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticFluencyPageState();
}

class _SemanticFluencyPageState extends ConsumerState<SemanticFluencyPage> {
  stt.SpeechToText? speechToText;

  String? recognizedWords;

  Future<void> init() async {
    speechToText = stt.SpeechToText();

    final available = await speechToText!.initialize(
      onError: (error) {
        print(error.errorMsg);
      },
      onStatus: (status) {
        print(status);
      },
    );
    if (!available) {
      print('error');
      return;
    }
    speechToText?.listen(
      onResult: (result) {
        print(result.recognizedWords);
        recognizedWords = result.recognizedWords;
        setState(() {});
      },
      localeId: 'ja_JP',
    );
  }

  @override
  void initState() {
    super.initState();
    init();
  }

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
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              recognizedWords ?? '',
              style: const TextStyle(fontSize: 24),
            ),
          ],
        ),
      ),
    );
  }
}
