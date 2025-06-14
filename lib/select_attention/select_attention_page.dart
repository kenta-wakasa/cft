import 'package:cft/common/common_app_bar.dart';
import 'package:cft/select_attention/select_attention_log.dart';
import 'package:cft/select_attention/select_attention_log_provider.dart';
import 'package:cft/select_attention/select_attention_problem.dart';
import 'package:cft/semantic_understanding.dart/semantic_understanding_for_calculation_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/v6.dart';

class SelectAttentionPage extends ConsumerStatefulWidget {
  const SelectAttentionPage({
    super.key,
    required this.nextPath,
    required this.id,
  });

  final String? nextPath;

  final String? id;

  static const path = '/select_attention';

  @override
  ConsumerState<SelectAttentionPage> createState() =>
      _SelectAttentionPageState();
}

class _SelectAttentionPageState extends ConsumerState<SelectAttentionPage> {
  var selectAttentionProblems = [
    SelectAttentionProblem(
      id: '1',
      targetWords: sampleTextTargetData,
      textData: sampleTextData['data'] as List<String>,
    ),
  ];
  var currentIndex = 0;

  final duration = const Duration(seconds: 60);

  var isPlaying = false;
  var isReady = false;

  SelectAttentionProblem get selectAttentionProblem =>
      selectAttentionProblems[currentIndex];

  Future<void> startTimer() async {
    isReady = true;
    isPlaying = true;
    selectAttentionProblems = [
      for (var index = 0; index < selectAttentionProblems.length; index++)
        if (index == currentIndex)
          selectAttentionProblems[index].copyWith(
            startedAt: DateTime.now(),
          )
        else
          selectAttentionProblems[index],
    ];
    setState(() {});

    while (isPlaying) {
      await Future.delayed(const Duration(microseconds: 10000 ~/ 60));
      if (!context.mounted) {
        return;
      }
      setState(() {});
      if (selectAttentionProblem.startedAt!
          .add(duration)
          .isBefore(DateTime.now())) {
        finishGame();
      }
    }
  }

  Future<void> finishGame() async {
    isPlaying = false;
    selectAttentionProblems = [
      for (var index = 0; index < selectAttentionProblems.length; index++)
        if (index == currentIndex)
          selectAttentionProblems[index].copyWith(
            endAt: DateTime.now(),
          )
        else
          selectAttentionProblems[index],
    ];

    final uid = FirebaseAuth.instance.currentUser?.uid;
    if (uid == null) {
      return;
    }

    ref.read(selectAttentionLogReferenceProvider).add(
          SelectAttentionLog(
            id: const UuidV6().generate(),
            documentId: null,
            userId: uid,
            selectAttentionProblems: [selectAttentionProblem],
          ),
        );

    /// 結果を送信
    await showDialog(
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
    if (!context.mounted) {
      return;
    }
    if (widget.nextPath != null) {
      context.go(
          '${widget.nextPath!}?nextPath=${SemanticUnderstandingForCalculationPage.path}&id=${widget.id}');
      return;
    }

    /// 再挑戦の場合
    selectAttentionProblems = [
      SelectAttentionProblem(
        id: '1',
        targetWords: sampleTextTargetData,
        textData: sampleTextData['data'] as List<String>,
      ),
    ];

    startTimer();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: isReady
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '文章の中から、次の単語をすべて選んでください。',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(8),
                      Wrap(
                        spacing: 16,
                        children: [
                          '[',
                          ...selectAttentionProblem.targetWords,
                          ']',
                        ]
                            .map(
                              (text) => Text(
                                text,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                            .toList(),
                      ),
                    ],
                  ),
                ),

                /// 制限時間
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: SizedBox(
                    width: 320,
                    child: LinearProgressIndicator(
                      value: 1 -
                          (DateTime.now()
                                  .difference(selectAttentionProblem.startedAt!)
                                  .inMilliseconds /
                              duration.inMilliseconds),
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 32),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: SizedBox(
                              width: 320,
                              child: Wrap(
                                runSpacing: 8,
                                children: [
                                  for (final (indexText, text)
                                      in selectAttentionProblem
                                          .textData.indexed)
                                    InkWell(
                                      onTap: () {
                                        if (selectAttentionProblem
                                            .userAnswerIndexes
                                            .contains(indexText)) {
                                          selectAttentionProblems = [
                                            for (var index = 0;
                                                index <
                                                    selectAttentionProblems
                                                        .length;
                                                index++)
                                              if (index == currentIndex)
                                                selectAttentionProblems[index]
                                                    .copyWith(
                                                  userAnswerIndexes:
                                                      selectAttentionProblem
                                                          .userAnswerIndexes
                                                          .difference(
                                                              {indexText}),
                                                )
                                              else
                                                selectAttentionProblems[index],
                                          ];
                                        } else {
                                          selectAttentionProblems = [
                                            for (var index = 0;
                                                index <
                                                    selectAttentionProblems
                                                        .length;
                                                index++)
                                              if (index == currentIndex)
                                                selectAttentionProblems[index]
                                                    .copyWith(
                                                  userAnswerIndexes:
                                                      selectAttentionProblem
                                                          .userAnswerIndexes
                                                          .union({indexText}),
                                                )
                                              else
                                                selectAttentionProblems[index],
                                          ];
                                        }

                                        setState(() {});
                                      },
                                      child: Text(
                                        text,
                                        style: TextStyle(
                                          color: selectAttentionProblem
                                                  .userAnswerIndexes
                                                  .contains(indexText)
                                              ? Colors.red
                                              : Colors.black,
                                          fontWeight: selectAttentionProblem
                                                  .userAnswerIndexes
                                                  .contains(indexText)
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                        ),
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          const Gap(32),
                        ],
                      ),
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(32),
                    child: ElevatedButton(
                      onPressed: finishGame,
                      child: const Text('決定'),
                    ),
                  ),
                ),
              ],
            )
          : Center(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      '文章の中から単語を抜き出すゲーム',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Gap(16),
                    const Text(
                      '次の画面に表示される文章の中から、指定された単語を抜き出してください。文章中の単語をタップすることで選択できます。※制限時間：60秒',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    ),
                    const Gap(32),
                    ElevatedButton(
                      onPressed: () {
                        startTimer();
                      },
                      child: const Text('スタート'),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

/// double型を少数第一位の%表記に変換する拡張
extension DoubleToPercent on double {
  String toPercent() {
    return '${(this * 100).toStringAsFixed(1)}%';
  }
}

const sampleTextTargetData = [
  '猫',
  '人間',
  '書生',
];

/// 以下同様に形態素解析で分割
const sampleTextData = {
  'data': [
    '輩',
    'は',
    '猫',
    'で',
    'ある',
    '。',
    '名前',
    'は',
    'まだ',
    '無い',
    '。',
    'どこ',
    'で',
    '生れ',
    'た',
    'か',
    'とんと',
    '見当',
    'が',
    'つか',
    'ぬ',
    '。',
    '何',
    'でも',
    '薄暗い',
    'じめじめし',
    'た',
    '所',
    'で',
    'ニャーニャー',
    '泣い',
    'て',
    'いた',
    '事',
    'だけ',
    'は',
    '記憶',
    'して',
    'いる',
    '。',
    '吾輩',
    'は',
    'ここ',
    'で',
    '始め',
    'て',
    '人間',
    'と',
    'いう',
    'もの',
    'を',
    '見た',
    '。',
    'しかも',
    'あと',
    'で',
    '聞く',
    'と',
    'それ',
    'は',
    '書生',
    'という',
    '人間',
    '中',
    'で',
    '一番',
    '獰悪',
    'な',
    '種族',
    'で',
    'あっ',
    'た',
    'そう',
    'だ',
    '。',
    'この',
    '書生',
    'という',
    'の',
    'は',
    '時々',
    '我々',
    'を',
    '捕',
    'つか',
    'まえ',
    'て',
    '煮',
    'て',
    '食',
    'う',
    'という',
    '話',
    'で',
    'ある',
    '。',
    'しかしその',
    '当時',
    'は',
    '何',
    'という',
    '考',
    'も',
    'なかっ',
    'た',
    'から',
    '別段',
    '恐しい',
    'と',
    'も',
    '思わ',
    'なかっ',
    'た',
    '。',
    'ただ',
    '彼',
    'の',
    '掌',
    'の',
    'ひら',
    'に',
    '載せ',
    'られ',
    'て',
    'スー',
    'と',
    '持ち上げ',
    'られ',
    'た',
    '時',
    '何',
    'だか',
    'フワフワ',
    'し',
    'た',
    '感じ',
    'が',
    'あっ',
    'た',
    'ばかり',
    'で',
    'ある',
    '。',
    '掌',
    'の',
    '上',
    'で',
    '少し',
    '落ちつい',
    'て',
    '書生',
    'の',
    '顔',
    'を',
    '見',
    'た',
    'の',
    'が',
    'いわゆる',
    '人間',
    'という',
    'もの',
    'の',
    '見始め',
    'で',
    'あろ',
    'う',
    '。',
    'この',
    '時',
    '妙',
    'な',
    'もの',
    'だ',
    'と',
    '思っ',
    'た',
    '感じ',
    'が',
    '今',
    'で',
    'も',
    '残っ',
    'て',
    'いる',
    '。',
    '第一',
    '毛',
    'を',
    'もっ',
    'て',
    '装飾',
    'さ',
    'れ',
    'べき',
    'はず',
    'の',
    '顔',
    'が',
    'つるつる',
    'し',
    'て',
    'まるで',
    '薬缶',
    'だ',
    '。',
    'その後',
    '猫',
    'に',
    'も',
    'だいぶ',
    '逢っ',
    'た',
    'が',
    'こんな',
    '片輪',
    'に',
    'は',
    '一度',
    'も',
    '出会わ',
    'し',
    'た',
    '事',
    'が',
    'ない',
    '。',
    'のみならず',
    '顔',
    'の',
    '真中',
    'が',
    'あまり',
    'に',
    '突起',
    'し',
    'て',
    'いる',
    '。',
    'そうして',
    'その',
    '穴',
    'の',
    '中',
    'から',
    '時々',
    'ぷうぷう',
    'と',
    '煙',
    'を',
    '吹く',
    '。',
    'どうも',
    '咽せ',
    'ぽく',
    'て',
    '実に',
    '弱っ',
    'た',
    '。',
    'これ',
    'が',
    '人間',
    'の',
    '飲む',
    '煙草',
    'という',
    'もの',
    'で',
    'ある',
    '事',
    'は',
    'ようやく',
    'この',
    '頃',
    '知っ',
    'た',
    '。',
  ]
};

const sample = '''吾輩は猫である。名前はまだ無い。
どこで生れたかとんと見当がつかぬ。;
何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。
吾輩はここで始めて人間というものを見た。;
しかもあとで聞くとそれは書生という人間中で一番獰悪な種族であったそうだ。
この書生というのは時々我々を捕つかまえて煮て食うという話である。
しかしその当時は何という考もなかったから別段恐しいとも思わなかった。
ただ彼の掌のひらに載せられてスーと持ち上げられた時何だかフワフワした感じがあったばかりである。
掌の上で少し落ちついて書生の顔を見たのがいわゆる人間というものの見始めであろう。
この時妙なものだと思った感じが今でも残っている。
第一毛をもって装飾されべきはずの顔がつるつるしてまるで薬缶だ。
その後猫にもだいぶ逢ったがこんな片輪には一度も出会わした事がない。
のみならず顔の真中があまりに突起している。
そうしてその穴の中から時々ぷうぷうと煙を吹く。
どうも咽せぽくて実に弱った。
これが人間の飲む煙草というものである事はようやくこの頃知った。''';
