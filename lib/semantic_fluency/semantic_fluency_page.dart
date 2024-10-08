import 'package:cft/common/common_app_bar.dart';
import 'package:cft/recent_memory/recent_memory_ans_page.dart';
import 'package:cft/semantic_fluency/answer_word_with_timestamp.dart';
import 'package:cft/semantic_fluency/semantic_fluency_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:uuid/v6.dart';

class SemanticFluencyPage extends ConsumerStatefulWidget {
  const SemanticFluencyPage({super.key, required this.nextPath});

  final String? nextPath;

  static const path = '/semantic_fluency';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticFluencyPageState();
}

class _SemanticFluencyPageState extends ConsumerState<SemanticFluencyPage> {
  var isReady = false;

  stt.SpeechToText? speechToText;

  final controller = TextEditingController();
  final scrollController = ScrollController();

  final answerWordWithTimestampList = <AnswerWordWithTimestamp>[];

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
      answerWordWithTimestampList.add(
        AnswerWordWithTimestamp(
          word: controller.text,
          timestamp: DateTime.now(),
        ),
      );
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

    final available = await speechToText!.initialize();
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

  var elapsed = Duration.zero;

  var isTimeUp = false;

  var startedAt = DateTime.now();
  Future<void> timer() async {
    startedAt = DateTime.now();
    while (true && context.mounted) {
      await Future.delayed(const Duration(milliseconds: 1000 ~/ 60));
      if (!context.mounted) {
        return;
      }
      elapsed =
          startedAt.add(const Duration(seconds: 60)).difference(DateTime.now());
      if (elapsed.isNegative) {
        timeUp();
        break;
      }
      setState(() {});
    }
  }

  Future<void> timeUp() async {
    await sendLogData();
    answerWordWithTimestampList.clear();
    isTimeUp = true;
    elapsed = Duration.zero;
    await speechToText?.stop();
    remainSec = countDown;
    isStandby = false;
    setState(() {});
  }

  Future<void> sendLogData() async {
    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return;
    }
    await FirebaseFirestore.instance.collection('semantic_fluency_log').add(
          SemanticFluencyLog(
            id: const UuidV6().generate(),
            startedAt: startedAt,
            userId: uid,
            answerWordWithTimestampList: answerWordWithTimestampList,
          ).toJson(),
        );
  }

  @override
  Widget build(BuildContext context) {
    if (!isReady) {
      return Scaffold(
        appBar: widget.nextPath == null ? const CommonAppBar() : null,
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    'カテゴリーに沿った単語を言い続けるゲーム',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  const Text(
                      '次のゲームでは、あるカテゴリーの中であなたが思いつく単語を１分間にできるだけたくさん行っておもらいます。スタートボタンを押すとカテゴリーが表示され１分間のタイマーが開始されます。'),
                  const Gap(32),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isReady = true;
                      });
                      timer();
                    },
                    child: const Text('スタート'),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }

    if (isTimeUp) {
      return Scaffold(
        appBar: widget.nextPath == null ? const CommonAppBar() : null,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '終了',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(16),
              if (widget.nextPath != null)
                ElevatedButton(
                  onPressed: () {
                    context.go(
                      '${widget.nextPath!}?nextPath=${RecentMemoryAnsPage.path}',
                    );
                  },
                  child: const Text('次のゲーム'),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      isReady = false;
                      isTimeUp = false;
                    });
                  },
                  child: const Text('再挑戦'),
                ),
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${elapsed.inMinutes}:${(elapsed.inSeconds % 60).toString().padLeft(2, '0')}',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const Text(
              'テーマ：動物',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
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
                  itemCount: answerWordWithTimestampList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.red[200],
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: Column(
                          children: [
                            Expanded(
                              child: Text(
                                answerWordWithTimestampList[index].word,
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
