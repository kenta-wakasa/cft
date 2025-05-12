import 'package:cft/common/common_app_bar.dart';
import 'package:cft/home/home_page.dart';
import 'package:cft/semantic_fluency/semantic_fluency_page.dart';
import 'package:cft/semantic_understanding.dart/meaning_problem.dart';
import 'package:cft/semantic_understanding.dart/meaning_problem_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SemanticUnderstandingForMeaningPage extends ConsumerStatefulWidget {
  const SemanticUnderstandingForMeaningPage({
    super.key,
    required this.nextPath,
    required this.id,
  });

  final String? nextPath;

  final String? id;

  static const path = '/semantic_understanding_for_meaning';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticUnderstandingPageState();
}

class _SemanticUnderstandingPageState
    extends ConsumerState<SemanticUnderstandingForMeaningPage> {
  var isReady = false;

  var currentIndex = 0;

  var problems = [...meaningProblems];

  static const duration = Duration(seconds: 60);

  void start() {
    problems = [
      for (var index = 0; index < problems.length; index++)
        if (index == 0)
          problems[index].copyWith(startedAt: DateTime.now())
        else
          problems[index]
    ];
    setState(() {
      isReady = true;
    });
  }

  final controller = TextEditingController();

  var isFinished = false;

  Future<void> timer() async {
    while (mounted) {
      await Future.delayed(const Duration(microseconds: 10000 ~/ 60));
      setState(() {});
      if (problems[currentIndex].startedAt != null &&
          problems[currentIndex]
              .startedAt!
              .add(duration)
              .isBefore(DateTime.now())) {
        await enterAnswer();
      }
    }
  }

  Future<void> enterAnswer() async {
    currentIndex++;
    problems = [
      for (var index = 0; index < problems.length; index++)
        if (index == currentIndex)
          problems[index].copyWith(startedAt: DateTime.now())
        else if (index == currentIndex - 1)
          problems[index].copyWith(
            answeredAt: DateTime.now(),
            userAns: controller.text,
          )
        else
          problems[index]
    ];
    controller.clear();

    if (currentIndex == problems.length) {
      final uid = FirebaseAuth.instance.currentUser?.uid;

      await FirebaseFirestore.instance.collection('meaning_problem_log').add(
            MeaningProblemLog(
              uid: uid!,
              documentId: null,
              meaningProblems: problems,
            ).toJson(),
          );
      setState(() {
        isFinished = true;
      });

      return;
    } else {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    timer();
  }

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return Scaffold(
        appBar: widget.nextPath == null ? const CommonAppBar() : null,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('お疲れ様でした！'),
              const Gap(16),
              if (widget.nextPath != null)
                ElevatedButton(
                  onPressed: () {
                    context.go(
                        '${widget.nextPath!}?nextPath=${SemanticFluencyPage.path}&id=${widget.id}');
                  },
                  child: const Text('次のゲーム'),
                )
              else
                ElevatedButton(
                  onPressed: () {
                    context.go(HomePage.path);
                  },
                  child: const Text('ホームに戻る'),
                ),
            ],
          ),
        ),
      );
    }
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
                    '意味理解・意味',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  const Text(
                      'これから日常の生活や社会的なルールについての質問をしますので、それに答えてください。※各問制限時間60秒'),
                  const Gap(8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(child: Image.asset('assets/bug.jpg')),
                      const Gap(8),
                      Expanded(child: Image.asset('assets/input_voice.jpeg')),
                    ],
                  ),
                  const Gap(32),
                  ElevatedButton(
                    onPressed: () {
                      start();
                    },
                    child: const Text('スタート'),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                problems[currentIndex].question,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Gap(16),

              /// 制限時間
              LinearProgressIndicator(
                value: 1 -
                    (DateTime.now()
                            .difference(problems[currentIndex].startedAt!)
                            .inMilliseconds /
                        duration.inMilliseconds),
              ),
              const Gap(16),

              TextFormField(
                controller: controller,
                minLines: 5,
                maxLines: 5,
                decoration: const InputDecoration(
                  hintText: '回答を入力してください',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: enterAnswer,
                child: const Text('確定'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final meaningProblems = [
  MeaningProblem(
    question: 'なぜ毎日歯を磨くことが重要ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【歯の健康維持】虫歯予防／歯周病予防／歯を健康に保つため',
      '【口臭防止】口臭予防／他人に迷惑をかけないため',
      '【習慣づけ】正しい習慣を身につけるため',
      '【見た目の清潔さ】歯の外見をきれいに保つため',
      '【全身の健康に影響】歯の健康が全身の健康に関わるため',
    ],
    difficulty: Difficulty.easy,
  ),
  MeaningProblem(
    question: 'なぜ学校に通うことが大切ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【知識を得るため】学ぶため／教養を深めるため',
      '【社会性を身につけるため】友人を作る／協力を学ぶ',
      '【将来のため】良い職業に就くため',
      '【習慣を身につけるため】規則正しい生活習慣を養うため',
      '【社会的な義務】社会の一員としての役割を果たすため',
    ],
    difficulty: Difficulty.easy,
  ),
  MeaningProblem(
    question: 'なぜ手を洗うことが大事ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【病気予防】感染症防止／ウイルスや細菌を除去するため',
      '【衛生を保つため】清潔にするため／手の汚れを取るため',
      '【他人への配慮】他人に病気をうつさないため',
      '【食べ物を安全にするため】食品を扱うときの衛生管理',
      '【自己保護】病気やアレルギー反応を防ぐため',
    ],
    difficulty: Difficulty.easy,
  ),
  // MeaningProblem(
  //   question: 'なぜ運動することが重要ですか？',
  //   commonReasons: [
  //     '【健康維持】体力をつけるため／病気予防のため',
  //     '【精神的な健康】ストレス解消のため／気分転換のため',
  //     '【筋肉・体力の維持】体力向上／筋肉を維持するため',
  //     '【肥満予防】健康的な体重を維持するため',
  //     '【長寿のため】健康的な老後を送るため／寿命を延ばすため',
  //   ],
  //   difficulty: Difficulty.easy,
  // ),
  // MeaningProblem(
  //   question: 'なぜ朝ご飯を食べることが大切ですか？',
  //   commonReasons: [
  //     '【エネルギー補給】活動するためのエネルギーを補給するため',
  //     '【集中力向上】集中力を高めるため／勉強や仕事の効率を上げるため',
  //     '【体調管理】健康を保つため／体調を整えるため',
  //     '【消化のリズムを整える】1日の消化機能を整えるため',
  //     '【代謝の促進】代謝を高め、体を目覚めさせるため',
  //   ],
  //   difficulty: Difficulty.easy,
  // ),
  MeaningProblem(
    question: 'なぜ地球温暖化に対して対策が必要ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【環境保全】自然環境を守るため／生態系を保護するため',
      '【人類の生活維持】異常気象や災害を防ぐため／生活環境の維持',
      '【将来への影響】未来の世代への影響を最小限にするため／長期的な環境保護のため',
      '【経済的影響の防止】農業や漁業への悪影響を最小化するため',
      '【生物多様性保護】絶滅危惧種を守るため／生態系の崩壊を防ぐため',
    ],
    difficulty: Difficulty.normal,
  ),
  MeaningProblem(
    question: 'なぜ法律を守ることが大切ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【社会の秩序を維持するため】混乱を防ぐため／平和を守るため',
      '【他者の権利を尊重するため】他人を傷つけないため／他人の権利を守るため',
      '【社会契約】社会のルールに基づく公正な生活を営むため',
      '【安全と安心の確保】犯罪の発生を抑えるため／安全な環境を作るため',
      '【公共の利益】全体の利益を守るため／社会の福祉を維持するため',
    ],
    difficulty: Difficulty.normal,
  ),
  MeaningProblem(
    question: 'なぜ他人を尊重することが重要ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【人間関係を良好に保つため】他者との信頼を築くため／良好なコミュニケーションを保つため',
      '【社会的調和を保つため】社会の一員として協調するため／争いを避けるため',
      '【相互理解を深めるため】異なる価値観を理解するため／文化的多様性を尊重するため',
      '【感情的成長】共感力や思いやりを育むため',
      '【社会的成功】他人との良好な関係を保つことでキャリアや生活が向上するため',
    ],
    difficulty: Difficulty.normal,
  ),
  // MeaningProblem(
  //   question: 'なぜお金を節約することが重要ですか？',
  //   commonReasons: [
  //     '【将来のため】将来のために備えるため／老後の資金を蓄えるため',
  //     '【予期しない事態に備えるため】突然の出費に対応するため／緊急時のため',
  //     '【安定した生活を送るため】安定した収入と支出のバランスを保つため',
  //     '【金銭管理の習慣】浪費を防ぎ、計画的な支出をするため',
  //     '【負債を防ぐため】借金を避け、財政的な独立を保つため',
  //   ],
  //   difficulty: Difficulty.normal,
  // ),
  // MeaningProblem(
  //   question: 'なぜ健康保険に加入することが重要ですか？',
  //   commonReasons: [
  //     '【予期しない医療費に対応するため】病気やケガの際に高額な医療費を負担しないため',
  //     '【医療を受けやすくするため】必要なときに医療サービスを受けやすくするため',
  //     '【社会の一員としての責任】共助の精神で社会全体の医療負担を分かち合うため',
  //     '【安心感を得るため】緊急時にも安心して医療を受けられるため',
  //     '【家庭の財政管理】家計に過度な負担をかけないため',
  //   ],
  //   difficulty: Difficulty.normal,
  // ),
  MeaningProblem(
    question: 'なぜ国際協力が重要ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【世界的な課題解決】地球規模の問題（気候変動、貧困）に対処するため',
      '【国際的な平和と安全保障】紛争の回避／安全保障の強化',
      '【経済発展の促進】貿易や経済協力のため／相互利益のため',
      '【文化的理解の促進】異文化理解を深めるため／国際的な連帯を強化するため',
      '【グローバル化への対応】国際社会での競争力を保つため／国際的な協力が必要な時代のため',
    ],
    difficulty: Difficulty.hard,
  ),
  MeaningProblem(
    question: 'なぜ難民を受け入れることが重要ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【人道的責任】基本的人権を守るため／人道的危機に対応するため',
      '【国際法的義務】難民条約に基づく義務を果たすため',
      '【社会的安定】難民問題が国際的に影響を及ぼすことを防ぐため',
      '【多様性と貢献】多様な人材や文化を受け入れることによる経済的・文化的貢献',
      '【国際的イメージの向上】国際社会での信頼を得るため／国の名声を高めるため',
    ],
    difficulty: Difficulty.hard,
  ),
  MeaningProblem(
    question: 'なぜ情報の機密性が重要ですか？ 2つあげてください。（※1つの解答欄に改行して2つの回答を記入してください）',
    commonReasons: [
      '【個人情報の保護】不正利用を防ぐため／プライバシーを守るため',
      '【企業の競争力維持】企業秘密を守り、競争力を維持するため',
      '【国家安全保障】機密情報が外部に漏れることを防ぐため',
      '【信頼の維持】信頼関係を保つため／関係者間の信用を維持するため',
      '【法的責任】情報流出による法的なリスクを回避するため',
    ],
    difficulty: Difficulty.hard,
  ),
  // MeaningProblem(
  //   question: 'なぜAI技術の進展に慎重であるべきですか？',
  //   commonReasons: [
  //     '【倫理的課題】人間の仕事が奪われる／社会的不平等が生まれる可能性がある',
  //     '【安全性の懸念】AIが誤作動を起こす危険／制御不能になる可能性',
  //     '【プライバシー保護】個人情報が不正に利用されるリスク',
  //     '【法的整備の必要性】新しい技術に対応する法制度が追いついていない',
  //     '【社会的影響】技術格差や新たな社会問題を引き起こす可能性がある',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ科学的根拠に基づく政策が重要ですか？',
  //   commonReasons: [
  //     '【政策の有効性】実証されたデータに基づき効果的な政策を立案するため',
  //     '【資源の無駄を防ぐ】無駄な支出やリソースの浪費を避けるため',
  //     '【公衆の信頼を得る】透明性を確保し、国民の信頼を得るため',
  //     '【リスクの最小化】科学的根拠によってリスクを最小限に抑えるため',
  //     '【長期的な持続性】持続可能な政策を作成するため／未来への影響を考慮するため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),

  /// copilotが勝手に出した。
  // MeaningProblem(
  //   question: 'なぜ情報の信頼性を確認することが重要ですか？',
  //   commonReasons: [
  //     '【誤情報の拡散防止】誤った情報が広まることを防ぐため',
  //     '【信頼性の確保】信頼できる情報源から情報を得るため',
  //     '【意思決定の質の向上】正確な情報に基づいて意思決定を行うため',
  //     '【社会的影響の最小化】誤った情報による社会的混乱を防ぐため',
  //     '【情報の価値を高める】信頼性の高い情報は価値が高まるため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ環境保護が重要ですか？',
  //   commonReasons: [
  //     '【生態系の保護】生物多様性を守り、生態系を維持するため',
  //     '【地球温暖化対策】気候変動を抑制し、地球環境を守るため',
  //     '【資源の持続可能性】資源の枯渇を防ぎ、持続可能な社会を実現するため',
  //     '【健康への影響】環境汚染が健康に悪影響を及ぼすため',
  //     '【未来への責任】未来の世代に美しい自然環境を残すため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ人権を尊重することが重要ですか？',
  //   commonReasons: [
  //     '【尊厳の保護】人間の尊厳を守るため／人権を尊重することが基本的な価値であるため',
  //     '【平等の実現】人種、性別、宗教などの違いに関わらず、平等な権利を保障するため',
  //     '【社会的正義】社会の不平等や差別をなくし、公正な社会を実現するため',
  //     '【民主主義の基盤】民主主義の基本原則である人権を尊重することが重要であるため',
  //     '【国際的責任】国際的な人権規範に基づき、人権を尊重することが国際社会での責任であるため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ教育の普及が重要ですか？',
  //   commonReasons: [
  //     '【知識の普及】知識や情報を広く共有し、社会全体の発展を促進するため',
  //     '【貧困削減】教育を受けることで貧困から抜け出す機会を提供するため',
  //     '【社会的統合】教育を受けることで社会に参加し、共通の価値観を共有するため',
  //     '【人権の保護】教育を受けることで人権を守り、自己実現を促進するため',
  //     '【持続可能な発展】教育を通じて持続可能な社会を築くため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ平和を守ることが重要ですか？',
  //   commonReasons: [
  //     '【人間の尊厳を守る】戦争や紛争を防ぎ、人間の尊厳を守るため',
  //     '【社会の安定】平和な社会を築くことで社会の安定を図るため',
  //     '【持続可能な発展】平和な環境を作ることで持続可能な発展を実現するため',
  //     '【国際的協力】国際社会での協力を促進し、平和を守るため',
  //     '【未来への責任】未来の世代に平和な世界を残すため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ社会的責任が重要ですか？',
  //   commonReasons: [
  //     '【持続可能な社会の実現】社会的責任を果たすことで持続可能な社会を実現するため',
  //     '【企業の信頼性】企業が社会的責任を果たすことで信頼性が高まるため',
  //     '【社会的不平等の解消】社会的責任を果たすことで不平等を解消し、社会全体の発展を促進するため',
  //     '【環境保護】企業や個人が環境に配慮した行動を取ることで環境保護に貢献するため',
  //     '【倫理的な行動】社会的責任を果たすことで倫理的な行動を促進するため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
  // MeaningProblem(
  //   question: 'なぜ自己啓発が重要ですか？',
  //   commonReasons: [
  //     '【自己成長】自己啓発を通じて自己成長を促進するため',
  //     '【目標達成】自己啓発を通じて目標達成をサポートするため',
  //     '【ストレス管理】自己啓発を通じてストレスを軽減し、心の健康を保つため',
  //     '【人間関係の向上】自己啓発を通じて人間関係を改善し、コミュニケーション能力を高めるため',
  //     '【幸福感の向上】自己啓発を通じて幸福感を高め、充実した人生を送るため',
  //   ],
  //   difficulty: Difficulty.hard,
  // ),
];

// 例題1: なぜ毎日歯を磨くことが重要ですか？
// 一般的理由:
// A: 【歯の健康維持】虫歯予防／歯周病予防／歯を健康に保つため
// B: 【口臭防止】口臭予防／他人に迷惑をかけないため
// C: 【習慣づけ】正しい習慣を身につけるため
// D: 【見た目の清潔さ】歯の外見をきれいに保つため
// E: 【全身の健康に影響】歯の健康が全身の健康に関わるため
// 例題2: なぜ学校に通うことが大切ですか？
// 一般的理由:
// A: 【知識を得るため】学ぶため／教養を深めるため
// B: 【社会性を身につけるため】友人を作る／協力を学ぶ
// C: 【将来のため】良い職業に就くため
// D: 【習慣を身につけるため】規則正しい生活習慣を養うため
// E: 【社会的な義務】社会の一員としての役割を果たすため
// 例題3: なぜ手を洗うことが大事ですか？
// 一般的理由:
// A: 【病気予防】感染症防止／ウイルスや細菌を除去するため
// B: 【衛生を保つため】清潔にするため／手の汚れを取るため
// C: 【他人への配慮】他人に病気をうつさないため
// D: 【食べ物を安全にするため】食品を扱うときの衛生管理
// E: 【自己保護】病気やアレルギー反応を防ぐため
// 例題4: なぜ運動することが重要ですか？
// 一般的理由:
// A: 【健康維持】体力をつけるため／病気予防のため
// B: 【精神的な健康】ストレス解消のため／気分転換のため
// C: 【筋肉・体力の維持】体力向上／筋肉を維持するため
// D: 【肥満予防】健康的な体重を維持するため
// E: 【長寿のため】健康的な老後を送るため／寿命を延ばすため
// 例題5: なぜ朝ご飯を食べることが大切ですか？
// 一般的理由:
// A: 【エネルギー補給】活動するためのエネルギーを補給するため
// B: 【集中力向上】集中力を高めるため／勉強や仕事の効率を上げるため
// C: 【体調管理】健康を保つため／体調を整えるため
// D: 【消化のリズムを整える】1日の消化機能を整えるため
// E: 【代謝の促進】代謝を高め、体を目覚めさせるため
// 難易度「普通」
// 例題1: なぜ地球温暖化に対して対策が必要ですか？
// 一般的理由:
// A: 【環境保全】自然環境を守るため／生態系を保護するため
// B: 【人類の生活維持】異常気象や災害を防ぐため／生活環境の維持
// C: 【将来への影響】未来の世代への影響を最小限にするため／長期的な環境保護のため
// D: 【経済的影響の防止】農業や漁業への悪影響を最小化するため
// E: 【生物多様性保護】絶滅危惧種を守るため／生態系の崩壊を防ぐため
// 例題2: なぜ法律を守ることが大切ですか？
// 一般的理由:
// A: 【社会の秩序を維持するため】混乱を防ぐため／平和を守るため
// B: 【他者の権利を尊重するため】他人を傷つけないため／他人の権利を守るため
// C: 【社会契約】社会のルールに基づく公正な生活を営むため
// D: 【安全と安心の確保】犯罪の発生を抑えるため／安全な環境を作るため
// E: 【公共の利益】全体の利益を守るため／社会の福祉を維持するため
// 例題3: なぜ他人を尊重することが重要ですか？
// 一般的理由:
// A: 【人間関係を良好に保つため】他者との信頼を築くため／良好なコミュニケーションを保つため
// B: 【社会的調和を保つため】社会の一員として協調するため／争いを避けるため
// C: 【相互理解を深めるため】異なる価値観を理解するため／文化的多様性を尊重するため
// D: 【感情的成長】共感力や思いやりを育むため
// E: 【社会的成功】他人との良好な関係を保つことでキャリアや生活が向上するため
// 例題4: なぜお金を節約することが重要ですか？
// 一般的理由:
// A: 【将来のため】将来のために備えるため／老後の資金を蓄えるため
// B: 【予期しない事態に備えるため】突然の出費に対応するため／緊急時のため
// C: 【安定した生活を送るため】安定した収入と支出のバランスを保つため
// D: 【金銭管理の習慣】浪費を防ぎ、計画的な支出をするため
// E: 【負債を防ぐため】借金を避け、財政的な独立を保つため
// 例題5: なぜ健康保険に加入することが重要ですか？
// 一般的理由:
// A: 【予期しない医療費に対応するため】病気やケガの際に高額な医療費を負担しないため
// B: 【医療を受けやすくするため】必要なときに医療サービスを受けやすくするため
// C: 【社会の一員としての責任】共助の精神で社会全体の医療負担を分かち合うため
// D: 【安心感を得るため】緊急時にも安心して医療を受けられるため
// E: 【家庭の財政管理】家計に過度な負担をかけないため
// 難易度「難しい」
// 例題1: なぜ国際協力が重要ですか？
// 一般的理由:
// A: 【世界的な課題解決】地球規模の問題（気候変動、貧困）に対処するため
// B: 【国際的な平和と安全保障】紛争の回避／安全保障の強化
// C: 【経済発展の促進】貿易や経済協力のため／相互利益のため
// D: 【文化的理解の促進】異文化理解を深めるため／国際的な連帯を強化するため
// E: 【グローバル化への対応】国際社会での競争力を保つため／国際的な協力が必要な時代のため
// 例題2: なぜ難民を受け入れることが重要ですか？
// 一般的理由:
// A: 【人道的責任】基本的人権を守るため／人道的危機に対応するため
// B: 【国際法的義務】難民条約に基づく義務を果たすため
// C: 【社会的安定】難民問題が国際的に影響を及ぼすことを防ぐため
// D: 【多様性と貢献】多様な人材や文化を受け入れることによる経済的・文化的貢献
// E: 【国際的イメージの向上】国際社会での信頼を得るため／国の名声を高めるため
// 例題3: なぜ情報の機密性が重要ですか？
// 一般的理由:
// A: 【個人情報の保護】不正利用を防ぐため／プライバシーを守るため
// B: 【企業の競争力維持】企業秘密を守り、競争力を維持するため
// C: 【国家安全保障】機密情報が外部に漏れることを防ぐため
// D: 【信頼の維持】信頼関係を保つため／関係者間の信用を維持するため
// E: 【法的責任】情報流出による法的なリスクを回避するため
// 例題4: なぜAI技術の進展に慎重であるべきですか？
// 一般的理由:
// A: 【倫理的課題】人間の仕事が奪われる／社会的不平等が生まれる可能性がある
// B: 【安全性の懸念】AIが誤作動を起こす危険／制御不能になる可能性
// C: 【プライバシー保護】個人情報が不正に利用されるリスク
// D: 【法的整備の必要性】新しい技術に対応する法制度が追いついていない
// E: 【社会的影響】技術格差や新たな社会問題を引き起こす可能性がある
// 例題5: なぜ科学的根拠に基づく政策が重要ですか？
// 一般的理由:
// A: 【政策の有効性】実証されたデータに基づき効果的な政策を立案するため
// B: 【資源の無駄を防ぐ】無駄な支出やリソースの浪費を避けるため
// C: 【公衆の信頼を得る】透明性を確保し、国民の信頼を得るため
// D: 【リスクの最小化】科学的根拠によってリスクを最小限に抑えるため
// E: 【長期的な持続性】持続可能な政策を作成するため／未来への影響を考慮するため
