import 'package:cft/common/common_app_bar.dart';
import 'package:cft/common/input_num_widget.dart';
import 'package:cft/home/home_page.dart';
import 'package:cft/semantic_understanding.dart/calculation_problem.dart';
import 'package:cft/semantic_understanding.dart/calculation_problem_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class SemanticUnderstandingForCalculationPage extends ConsumerStatefulWidget {
  const SemanticUnderstandingForCalculationPage({super.key});

  static const path = '/semantic_understanding_for_calculation';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticUnderstandingPageState();
}

class _SemanticUnderstandingPageState
    extends ConsumerState<SemanticUnderstandingForCalculationPage> {
  var isReady = false;

  var currentIndex = 0;

  var problems = [...calculationProblems];

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

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isFinished) {
      return Scaffold(
        appBar: const CommonAppBar(),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text('お疲れ様でした！'),
              const Gap(16),
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
        appBar: const CommonAppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    '意味理解・計算',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Gap(16),
                  const Text('次の問題では、算数の問題をあなたに解いてもらいます。'),
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
      appBar: const CommonAppBar(),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  problems[currentIndex].question,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const Gap(16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 120,
                      child: TextFormField(
                        controller: controller,
                        readOnly: true,
                        textAlign: TextAlign.right,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    Text(
                      '${controller.text} ${problems[currentIndex].unit}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                InputNumWidget(
                  controller: controller,
                  onSubmitted: () async {
                    currentIndex++;

                    problems = [
                      for (var index = 0; index < problems.length; index++)
                        if (index == currentIndex)
                          problems[index].copyWith(startedAt: DateTime.now())
                        else if (index == currentIndex - 1)
                          problems[index].copyWith(
                            answeredAt: DateTime.now(),
                            userAns: int.tryParse(controller.text) ?? 0,
                          )
                        else
                          problems[index]
                    ];
                    controller.clear();

                    if (currentIndex == problems.length) {
                      final uid = FirebaseAuth.instance.currentUser?.uid;

                      await FirebaseFirestore.instance
                          .collection('calculation_problem_log')
                          .add(
                            CalculationProblemLog(
                              uid: uid!,
                              calculationProblems: problems,
                            ).toJson(),
                          );
                      setState(() {
                        isFinished = true;
                      });

                      return;
                    } else {
                      setState(() {});
                    }
                  },
                ),
                const Gap(16),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final calculationProblems = [
  CalculationProblem(
    question: 'ある人が時速5キロメートルで歩いています。45キロメートル歩くには何時間かかりますか。',
    unit: '時間',
    answer: 9,
  ),
  CalculationProblem(
    question: '12と8と16を平均するといくつになりますか。',
    unit: '',
    answer: 12,
  ),
  CalculationProblem(
    question: 'ここに砂糖が60キログラムあります。8つの袋に3キログラムずつ詰めると、あと何キログラム残りますか。',
    unit: 'キログラム',
    answer: 36,
  ),
  CalculationProblem(
    question: '中古車の値段は新品の5分の4でした。その中古車を80万円で買ったとすれば、新品の値段は何円ですか。',
    unit: '円',
    answer: 100,
  ),
  CalculationProblem(
    question: 'ノート3冊の重さは合わせて45グラムです。ノート10冊では何グラムになりますか。',
    unit: 'グラム',
    answer: 150,
  ),
  CalculationProblem(
    question: '6時間かけて300キロメートルを運転しました。時速は何キロメートルでしょう。',
    unit: 'キロメートル/時',
    answer: 50,
  ),
  CalculationProblem(
    question: '税込で20万円のテレビを10パーセント引きの値段で買いました。何万円支払いましたか。',
    unit: '万円',
    answer: 18,
  ),
  CalculationProblem(
    question: 'CさんとDさん、二人の体重の割合は5対3です。二人の体重を合わせると64キログラムです。重い方の人の体重は何キログラムですか。',
    unit: 'キログラム',
    answer: 40,
  ),
  CalculationProblem(
    question: '5台の機械を使うと12日間で終わる仕事があります。この仕事を3日で終わらせるには、何台の機械が必要ですか。',
    unit: '台',
    answer: 20,
  ),
  CalculationProblem(
    question: 'E、F、G、H、Iという5個の玉があります。Eの玉を他の4つの玉に1回ずつ順に当てることにします。いく通りの順番がありますか。',
    unit: '通り',
    answer: 24,
  ),
];

// 	1.	ある人が時速5キロメートルで歩いています。45キロメートル歩くには何時間かかりますか。
// 回答：45キロメートル ÷ 5キロメートル/時 = 9時間
// 	2.	12と8と16を平均するといくつになりますか。
// 回答：(12 + 8 + 16) ÷ 3 = 12
// 	3.	ここに砂糖が60キログラムあります。8つの袋に3キログラムずつ詰めると、あと何キログラム残りますか。
// 回答：60キログラム - (3キログラム × 8袋) = 36キログラム
// 	4.	中古車の値段は新品の5分の4でした。その中古車を80万円で買ったとすれば、新品の値段は何円ですか。
// 回答：80万円 ÷ (4/5) = 100万円
// 	5.	ノート3冊の重さは合わせて45グラムです。ノート10冊では何グラムになりますか。
// 回答：(45グラム ÷ 3冊) × 10冊 = 150グラム
// 	6.	6時間かけて300キロメートルを運転しました。時速は何キロメートルでしょう。
// 回答：300キロメートル ÷ 6時間 = 50キロメートル/時
// 	7.	税込で20万円のテレビを10パーセント引きの値段で買いました。何万円支払いましたか。
// 回答：20万円 - (20万円 × 10%) = 18万円
// 	8.	CさんとDさん、二人の体重の割合は5対3です。二人の体重を合わせると64キログラムです。重い方の人の体重は何キログラムですか。
// 回答：64キログラム ÷ (5 + 3) × 5 = 40キログラム
// 	9.	5台の機械を使うと12日間で終わる仕事があります。この仕事を3日で終わらせるには、何台の機械が必要ですか。
// 回答：(5台 × 12日) ÷ 3日 = 20台
// 	10.	E、F、G、H、Iという5個の玉があります。Eの玉を他の4つの玉に1回ずつ順に当てることにします。いく通りの順番がありますか。
// 回答：4つの玉の順列なので、4! = 24通り