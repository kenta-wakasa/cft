import 'dart:convert';
import 'dart:html';

import 'package:cft/home/home_page.dart';
import 'package:cft/immediate_memory/immediate_memory_log.dart';
import 'package:cft/immediate_memory/immediate_memory_log_provider.dart';
import 'package:cft/persistence_attention/persistence_attention_log.dart';
import 'package:cft/persistence_attention/persistence_attention_logs_stream.dart';
import 'package:cft/select_attention/select_attention_log.dart';
import 'package:cft/select_attention/select_attention_log_provider.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
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
                        context.go(HomePage.path);
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
        child: Row(
          children: [
            Container(
              width: 120,
              color: Colors.grey[200],
              child: Column(
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
                    child: const Text('選択性注意'),
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
                selectedLogs = logs;
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
                      'userId: ${log.userId}:${log.correctCount}問正解 ${log.incorrectCount}問誤答 正解率${log.correctRate.toPercent()}',
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
                selectedLogs = logs;
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
                      'userId: ${log.userId}',
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
                selectedLogs = logs;
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
                      'userId: ${log.userId}',
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
  selectAttention,
  immediateMemory,
}
