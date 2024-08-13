import 'dart:convert';
import 'dart:html';

import 'package:auto_route/auto_route.dart';
import 'package:cft/persistence_attention/persistence_attention_log.dart';
import 'package:cft/persistence_attention/persistence_attention_logs_stream.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:intl/intl.dart';

@RoutePage()
class TestLogPage extends ConsumerStatefulWidget {
  const TestLogPage({super.key});

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
        child: Row(
          children: [
            Container(
              width: 120,
              color: Colors.grey[200],
              child: Column(
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _selectedType = TestLogType.persistenceAttention;
                      setState(() {});
                    },
                    child: const Text('持続性注意'),
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
              child: const Text('選択したデータをcsvでダウンロード'),
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
                      '${log.correctCount}問正解 ${log.incorrectCount}問誤答 正解率${log.correctRate.toPercent()}',
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

class SelectAttentionLogPage extends ConsumerWidget {
  const SelectAttentionLogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

class ImmediateMemoryLogPage extends ConsumerWidget {
  const ImmediateMemoryLogPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container();
  }
}

enum TestLogType {
  persistenceAttention,
  selectAttention,
  immediateMemory,
}
