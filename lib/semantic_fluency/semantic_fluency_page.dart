import 'package:cft/common/common_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

class SemanticFluencyPage extends ConsumerStatefulWidget {
  const SemanticFluencyPage({super.key});

  static const path = '/semantic_fluency';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticFluencyPageState();
}

class _SemanticFluencyPageState extends ConsumerState<SemanticFluencyPage> {
  stt.SpeechToText? speechToText;

  final controller = TextEditingController();
  final scrollController = ScrollController();

  List<String> recognizedWords = [];

  var isStandby = false;

  /// カウントダウンの変数
  static const countDown = 2;

  int remainSec = countDown;

  Future<void> startListening() async {
    setState(() {
      isStandby = true;
    });
    controller.clear();

    speechToText?.listen(
      onResult: (result) async {
        setState(() {
          controller.text = result.recognizedWords;
        });
      },
      localeId: 'ja_JP',
    );

    while (remainSec > 0) {
      setState(() {
        remainSec--;
      });
      await Future.delayed(const Duration(seconds: 1));
    }
  }

  Future<void> stopListening() async {
    if (controller.text.isEmpty) {
      if (speechToText?.isListening == false) {
        startListening();
      }
      return;
    }
    setState(() {
      recognizedWords.add(controller.text);
    });

    await speechToText?.stop();

    remainSec = countDown;
    isStandby = false;
    setState(() {});

    /// 描画が終わったら一番下にスクロールする
    WidgetsBinding.instance.addPostFrameCallback((_) {
      scrollController.animateTo(
        scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

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
      return;
    }
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    scrollController.dispose();
    speechToText?.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  controller: scrollController,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                  ),
                  itemCount: recognizedWords.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red[200],
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                recognizedWords[index],
                                style: const TextStyle(fontSize: 20),
                              ),
                            ),
                            Text(
                              (index + 1).toString(),
                              style: const TextStyle(fontSize: 10),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const Gap(32),
            if (remainSec == 0)
              SizedBox(
                width: 320,
                height: 64,
                child: TextFormField(
                  controller: controller,
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: '単語を認識中...',
                    border: OutlineInputBorder(),
                  ),
                ),
              )
            else
              const SizedBox(
                height: 64,
              ),
            if (remainSec == 0)
              GestureDetector(
                onTap: () {
                  stopListening();
                },
                child: Container(
                  width: 240,
                  height: 64,
                  padding: const EdgeInsets.all(16),
                  color: Colors.blue,
                  child: const Center(
                    child: Text(
                      '確定',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            if (remainSec > 0 && isStandby)
              Container(
                width: 240,
                height: 64,
                padding: const EdgeInsets.all(16),
                color: Colors.green,
                child: const Center(
                  child: CircularProgressIndicator(
                    color: Colors.white,
                  ),
                ),
              ),
            if (remainSec > 0 && !isStandby)
              GestureDetector(
                onTap: () {
                  startListening();
                },
                child: Container(
                  width: 240,
                  height: 64,
                  padding: const EdgeInsets.all(16),
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      'タップで音声入力',
                      style: TextStyle(fontSize: 24, color: Colors.white),
                    ),
                  ),
                ),
              ),
            const Gap(16),
          ],
        ),
      ),
    );
  }
}
