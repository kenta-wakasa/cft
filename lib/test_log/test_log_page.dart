import 'dart:convert';
import 'dart:html';

import 'package:cft/common/common_app_bar.dart';
import 'package:cft/immediate_memory/immediate_memory_log.dart';
import 'package:cft/immediate_memory/immediate_memory_log_provider.dart';
import 'package:cft/performance/performance_problem_log.dart';
import 'package:cft/persistence_attention/persistence_attention_log.dart';
import 'package:cft/persistence_attention/persistence_attention_logs_stream.dart';
import 'package:cft/recent_memory/recent_memory_log.dart';
import 'package:cft/select_attention/select_attention_log.dart';
import 'package:cft/select_attention/select_attention_log_provider.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:cft/semantic_fluency/semantic_fluency_log.dart';
import 'package:cft/semantic_understanding.dart/calculation_problem_log.dart';
import 'package:cft/semantic_understanding.dart/meaning_problem_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

class TestLogPage extends ConsumerStatefulWidget {
  const TestLogPage({super.key});

  static const path = '/test_log';

  @override
  ConsumerState<TestLogPage> createState() => _TestLogPageState();
}

class _TestLogPageState extends ConsumerState<TestLogPage> {
  var _selectedType = TestLogType.persistenceAttention;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(),
      body: Center(
        child: Row(
          children: [
            Container(
              width: 160,
              color: Colors.grey[200],
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedType == TestLogType.persistenceAttention
                              ? Colors.blue
                              : null,
                      foregroundColor:
                          _selectedType == TestLogType.persistenceAttention
                              ? Colors.white
                              : null,
                    ),
                    onPressed: () {
                      _selectedType = TestLogType.persistenceAttention;
                      setState(() {});
                    },
                    child: const Text('持続性注意'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedType == TestLogType.immediateMemory
                              ? Colors.blue
                              : null,
                      foregroundColor:
                          _selectedType == TestLogType.immediateMemory
                              ? Colors.white
                              : null,
                    ),
                    onPressed: () {
                      _selectedType = TestLogType.immediateMemory;
                      setState(() {});
                    },
                    child: const Text('即時記憶'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedType == TestLogType.selectAttention
                              ? Colors.blue
                              : null,
                      foregroundColor:
                          _selectedType == TestLogType.selectAttention
                              ? Colors.white
                              : null,
                    ),
                    onPressed: () {
                      _selectedType = TestLogType.selectAttention;
                      setState(() {});
                    },
                    child: const Text('選択制注意'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedType ==
                              TestLogType.semanticUnderstandingForMeaning
                          ? Colors.blue
                          : null,
                      foregroundColor: _selectedType ==
                              TestLogType.semanticUnderstandingForMeaning
                          ? Colors.white
                          : null,
                    ),
                    onPressed: () {
                      _selectedType =
                          TestLogType.semanticUnderstandingForMeaning;
                      setState(() {});
                    },
                    child: const Text('意味理解・意味'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedType ==
                              TestLogType.semanticUnderstandingForCalculation
                          ? Colors.blue
                          : null,
                      foregroundColor: _selectedType ==
                              TestLogType.semanticUnderstandingForCalculation
                          ? Colors.white
                          : null,
                    ),
                    onPressed: () {
                      _selectedType =
                          TestLogType.semanticUnderstandingForCalculation;
                      setState(() {});
                    },
                    child: const Text('意味理解・計算'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:
                          _selectedType == TestLogType.semanticFluency
                              ? Colors.blue
                              : null,
                      foregroundColor:
                          _selectedType == TestLogType.semanticFluency
                              ? Colors.white
                              : null,
                    ),
                    onPressed: () {
                      _selectedType = TestLogType.semanticFluency;
                      setState(() {});
                    },
                    child: const Text('意味流暢性'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedType == TestLogType.performance
                          ? Colors.blue
                          : null,
                      foregroundColor: _selectedType == TestLogType.performance
                          ? Colors.white
                          : null,
                    ),
                    onPressed: () {
                      _selectedType = TestLogType.performance;
                      setState(() {});
                    },
                    child: const Text('遂行・計画変更'),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: _selectedType == TestLogType.recentMemory
                          ? Colors.blue
                          : null,
                      foregroundColor: _selectedType == TestLogType.recentMemory
                          ? Colors.white
                          : null,
                    ),
                    onPressed: () {
                      _selectedType = TestLogType.recentMemory;
                      setState(() {});
                    },
                    child: const Text('近時記憶'),
                  ),
                ],
              ),
            ),
            const Gap(16),
            Expanded(
              child: switch (_selectedType) {
                TestLogType.persistenceAttention =>
                  const PersistenceAttentionLogPage(),
                TestLogType.selectAttention => const SelectAttentionLogPage(),
                TestLogType.immediateMemory => const ImmediateMemoryLogPage(),
                TestLogType.semanticUnderstandingForMeaning =>
                  const SemanticUnderstandingForMeaningLogPage(),
                TestLogType.semanticUnderstandingForCalculation =>
                  const SemanticUnderstandingForCalculationLogPage(),
                TestLogType.semanticFluency => const SemanticFluencyLogPage(),
                TestLogType.performance => const PerformanceLogPage(),
                TestLogType.recentMemory => const RecentMemoryLogPage(),
              },
            ),
          ],
        ),
      ),
    );
  }
}

class PersistenceAttentionLogPage extends ConsumerStatefulWidget {
  const PersistenceAttentionLogPage({super.key});

  @override
  ConsumerState<PersistenceAttentionLogPage> createState() =>
      _PersistenceAttentionLogPageState();
}

class _PersistenceAttentionLogPageState
    extends ConsumerState<PersistenceAttentionLogPage> {
  var selectedLogs = <PersistenceAttentionLog>[];

  Future<void> downloadResult(PersistenceAttentionLog log) async {
    final bodys = log.validAnswers.map((problem) {
      return '${log.userId},'
          '${log.id},'
          '${log.startedAt.toIso8601String()},'
          '${log.correctCount},'
          '${log.incorrectCount},'
          '${log.correctRate},'
          '${problem.answeredAt!.toIso8601String()},'
          '${problem.a},'
          '${problem.randomOperator.toSymbol},'
          '${problem.b},'
          '${problem.answer},'
          '${problem.userAnswer}';
    });

    const header = 'ユーザーID,ログID,ゲーム開始時間,正解数,誤答数,正解率,回答時間,a,記号,b,解答,ユーザーの回答';
    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '持続性注意-${log.userId}-${log.startedAt.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs =
        ref.watch(streamPersistenceAttentionLogsProvider).valueOrNull ?? [];
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.startedAt)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.userId}:${log.correctCount}問正解 ${log.incorrectCount}問誤答 正解率${log.correctRate.toPercent()}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class SelectAttentionLogPage extends ConsumerStatefulWidget {
  const SelectAttentionLogPage({super.key});

  @override
  ConsumerState<SelectAttentionLogPage> createState() =>
      _SelectAttentionLogPageState();
}

class _SelectAttentionLogPageState
    extends ConsumerState<SelectAttentionLogPage> {
  var selectedLogs = <SelectAttentionLog>[];

  Future<void> downloadResult(SelectAttentionLog log) async {
    final bodys = log.selectAttentionProblems.map((problem) {
      return [
        log.userId,
        log.id,
        log.selectAttentionProblems.first.startedAt!.toIso8601String(),
        problem.id,
        problem.startedAt!.toIso8601String(),
        problem.endAt!.toIso8601String(),
        problem.correctCount,
        problem.correctAnswerCount,
        problem.incorrectAnswerCount,
        problem.correctRate,
        problem.textData.join('/'),
        problem.targetWords.join('/'),
        problem.correctIndexes.join('/'),
        problem.userAnswerIndexes.join('/'),
      ].join(',');
    });

    final header = [
      'ユーザーID',
      'ログID',
      'ゲーム開始時間',
      '問題ID',
      '問題開始時間',
      '問題終了時間',
      'ターゲット数',
      '正解数',
      '誤答数',
      '正解率',
      'テキスト',
      'ターゲット',
      '正解インデックス',
      'ユーザー解答インデックス'
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '選択性注意-${log.userId}-${log.selectAttentionProblems.first.startedAt!.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(selectAttentionLogsProvider).valueOrNull ?? [];
    logs.sort((a, b) => b.selectAttentionProblems.first.startedAt!
        .compareTo(a.selectAttentionProblems.first.startedAt!));
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.selectAttentionProblems.first.startedAt!)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.userId}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class ImmediateMemoryLogPage extends ConsumerStatefulWidget {
  const ImmediateMemoryLogPage({super.key});

  @override
  ConsumerState<ImmediateMemoryLogPage> createState() =>
      _ImmediateMemoryLogPageState();
}

class _ImmediateMemoryLogPageState
    extends ConsumerState<ImmediateMemoryLogPage> {
  var selectedLogs = <ImmediateMemoryLog>[];

  Future<void> downloadResult(ImmediateMemoryLog log) async {
    final bodys = [
      for (final (index, number)
          in log.immediateMemoryProblem.randomNumbers.indexed)
        [
          (log.userId),
          (log.id),
          (log.immediateMemoryProblem.startedAt!.toIso8601String()),
          (log.immediateMemoryProblem.correctAnswerCount),
          (log.immediateMemoryProblem.incorrectAnswerCount),
          (log.immediateMemoryProblem.correctRate),
          number == log.immediateMemoryProblem.userAnswerNumbers[index]
              ? true
              : false,
          number,
          log.immediateMemoryProblem.userAnswerNumbers[index],
        ].join(',')
    ];

    final header = [
      'ユーザーID',
      'ログID',
      'ゲーム開始時間',
      '正解数',
      '誤答数',
      '正解率',
      '正解かどうか',
      '問題',
      'ユーザーの回答',
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '即時記憶-${log.userId}-${log.immediateMemoryProblem.startedAt!.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(immediateMemoryLogsProvider).valueOrNull ?? [];
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.immediateMemoryProblem.startedAt!)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.userId}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final meaningProblemLogProvider =
    StreamProvider.autoDispose<List<MeaningProblemLog>>((ref) {
  return FirebaseFirestore.instance
      .collection('meaning_problem_log')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return MeaningProblemLog.fromJson(data);
          }).toList());
});

class SemanticUnderstandingForMeaningLogPage extends ConsumerStatefulWidget {
  const SemanticUnderstandingForMeaningLogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticUnderstandingForMeaningLogPageState();
}

class _SemanticUnderstandingForMeaningLogPageState
    extends ConsumerState<SemanticUnderstandingForMeaningLogPage> {
  var selectedLogs = <MeaningProblemLog>[];

  Future<void> downloadResult(MeaningProblemLog log) async {
    final bodys = [
      for (final problem in log.meaningProblems)
        [
          log.uid,
          log.id,
          problem.question,
          problem.difficulty.name,
          problem.startedAt?.toIso8601String(),
          problem.answeredAt?.toIso8601String(),
          problem.userAns,
        ].join(',')
    ];

    final header = [
      'ユーザーID',
      'ログID',
      '問題文',
      '難易度',
      '開始時間',
      '回答時間',
      'ユーザーの回答',
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '意味理解・意味-${log.uid}-${log.meaningProblems.first.startedAt!.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(meaningProblemLogProvider).valueOrNull ?? [];
    logs.sort((a, b) => b.meaningProblems.first.startedAt!
        .compareTo(a.meaningProblems.first.startedAt!));
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.meaningProblems.first.startedAt!)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.uid}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

// calculation_problem_log
final calculationProblemLogProvider =
    StreamProvider.autoDispose<List<CalculationProblemLog>>((ref) {
  return FirebaseFirestore.instance
      .collection('calculation_problem_log')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return CalculationProblemLog.fromJson(data);
          }).toList());
});

class SemanticUnderstandingForCalculationLogPage
    extends ConsumerStatefulWidget {
  const SemanticUnderstandingForCalculationLogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticUnderstandingForCalculationLogPageState();
}

class _SemanticUnderstandingForCalculationLogPageState
    extends ConsumerState<SemanticUnderstandingForCalculationLogPage> {
  var selectedLogs = <CalculationProblemLog>[];

  Future<void> downloadResult(CalculationProblemLog log) async {
    final bodys = [
      for (final problem in log.calculationProblems)
        [
          log.uid,
          log.id,
          problem.startedAt?.toIso8601String(),
          problem.answeredAt?.toIso8601String(),
          problem.question,
          problem.answer,
          problem.userAns,
        ].join(',')
    ];

    final header = [
      'ユーザーID',
      'ログID',
      '開始時間',
      '回答時間',
      '問題文',
      '正解',
      'ユーザーの回答',
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '意味理解・計算-${log.uid}-${log.calculationProblems.first.startedAt!.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(calculationProblemLogProvider).valueOrNull ?? [];
    logs.sort((a, b) => b.calculationProblems.first.startedAt!
        .compareTo(a.calculationProblems.first.startedAt!));
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.calculationProblems.first.startedAt!)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.uid}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final sematicFluencyLogProvider =
    StreamProvider.autoDispose<List<SemanticFluencyLog>>((ref) {
  return FirebaseFirestore.instance
      .collection('semantic_fluency_log')
      .orderBy('startedAt', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return SemanticFluencyLog.fromJson(data);
          }).toList());
});

class SemanticFluencyLogPage extends ConsumerStatefulWidget {
  const SemanticFluencyLogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _SemanticFluencyLogPageState();
}

class _SemanticFluencyLogPageState
    extends ConsumerState<SemanticFluencyLogPage> {
  var selectedLogs = <SemanticFluencyLog>[];

  Future<void> downloadResult(SemanticFluencyLog log) async {
    final bodys = [
      for (final answer in log.answerWordWithTimestampList)
        [
          log.userId,
          log.id,
          log.startedAt.toIso8601String(),
          log.theme,
          answer.timestamp.toIso8601String(),
          answer.word,
        ].join(',')
    ];

    final header = [
      'ユーザーID',
      'ログID',
      '開始時間',
      'カテゴリー',
      '回答時間',
      '回答した単語',
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '意味流暢性-${log.userId}-${log.startedAt.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(sematicFluencyLogProvider).valueOrNull ?? [];
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.startedAt)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.userId}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final performanceProblemLogProvider =
    StreamProvider.autoDispose<List<PerformanceProblemLog>>((ref) {
  return FirebaseFirestore.instance
      .collection('performance_problem_log')
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            data['id'] = doc.id;
            return PerformanceProblemLog.fromJson(data);
          }).toList());
});

class PerformanceLogPage extends ConsumerStatefulWidget {
  const PerformanceLogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _PerformanceLogPageState();
}

class _PerformanceLogPageState extends ConsumerState<PerformanceLogPage> {
  var selectedLogs = <PerformanceProblemLog>[];

  Future<void> downloadResult(PerformanceProblemLog log) async {
    final bodys = [
      for (final problem in log.performanceProblems)
        for (final (index, value) in (problem.answeredAtList).indexed)
          [
            log.uid,
            log.id,
            problem.startedAt?.toIso8601String(),
            problem.questionTexts[index],
            value.toIso8601String(),
            problem.answerTexts[index],
            problem.userAnswers[index],
          ].join(',')
    ];

    final header = [
      'ユーザーID',
      'ログID',
      '開始時間',
      '問題文',
      '回答時間',
      '正解',
      'ユーザーの回答',
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '遂行・計画変更-${log.uid}-${log.performanceProblems.first.startedAt?.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(performanceProblemLogProvider).valueOrNull ?? [];
    logs.sort((a, b) => b.performanceProblems.first.startedAt!
        .compareTo(a.performanceProblems.first.startedAt!));
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.performanceProblems.first.startedAt!)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.uid}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

final recentMemoryLogProvider =
    StreamProvider.autoDispose<List<RecentMemoryLog>>((ref) {
  return FirebaseFirestore.instance
      .collection('recent_memory_log')
      .orderBy('createdAt', descending: true)
      .snapshots()
      .map((snapshot) => snapshot.docs.map((doc) {
            final data = doc.data();
            return RecentMemoryLog.fromJson(data);
          }).toList());
});

class RecentMemoryLogPage extends ConsumerStatefulWidget {
  const RecentMemoryLogPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentMemoryLogPageState();
}

class _RecentMemoryLogPageState extends ConsumerState<RecentMemoryLogPage> {
  var selectedLogs = <RecentMemoryLog>[];

  Future<void> downloadResult(RecentMemoryLog log) async {
    final bodys = [
      [
        log.uid,
        log.id,
        log.createdAt.toIso8601String(),
        log.finishedAt?.toIso8601String(),
        log.memoryList.join('/'),
        log.answerList.join('/'),
      ].join(',')
    ];

    final header = [
      'ユーザーID',
      'ログID',
      '開始時間',
      '終了時間'
          'カテゴリー',
      '最初に入力した3つ',
      '最後に入力した3つ',
    ].join(',');

    final csvString = [header, ...bodys].join('\n');

    /// 参考：https://qiita.com/ling350181/items/636e0d8d15559070ec05
    List<int> excelCsvBytes = [0xEF, 0xBB, 0xBF, ...utf8.encode(csvString)];
    String base64ExcelCsvBytes = base64Encode(excelCsvBytes);
    AnchorElement(
        href: 'data:text/plain;charset=utf-8;base64,$base64ExcelCsvBytes')
      ..setAttribute(
        'download',
        '近時記憶-${log.uid}-${log.createdAt.toIso8601String()}.csv',
      )
      ..click();
  }

  @override
  Widget build(BuildContext context) {
    final logs = ref.watch(recentMemoryLogProvider).valueOrNull ?? [];
    return Column(
      children: [
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                for (final log in selectedLogs) {
                  downloadResult(log);
                }
              },
              child: const Text('選択データをダウンロード'),
            ),
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                selectedLogs = [...logs];
                setState(() {});
              },
              child: const Text('すべて選択'),
            ),
          ],
        ),
        const Gap(16),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (final log in logs)
                  CheckboxListTile(
                    value: selectedLogs.contains(log),
                    onChanged: (value) {
                      if (value ?? false) {
                        selectedLogs.add(log);
                      } else {
                        selectedLogs.remove(log);
                      }
                      setState(() {});
                    },
                    title: Text(DateFormat('yyyy年 MM月 dd日 HH時mm分')
                        .format(log.createdAt)),
                    subtitle: Text(
                      /// 正解数 誤答数 正解率 を表示
                      'uid: ${log.uid}',
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

enum TestLogType {
  persistenceAttention,
  immediateMemory,
  selectAttention,
  semanticUnderstandingForMeaning,
  semanticUnderstandingForCalculation,
  semanticFluency,
  performance,
  recentMemory,
}
