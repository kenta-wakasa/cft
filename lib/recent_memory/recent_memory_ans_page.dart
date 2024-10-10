import 'package:cft/home/home_page.dart';
import 'package:cft/recent_memory/recent_memory_log.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecentMemoryAnsPage extends ConsumerStatefulWidget {
  const RecentMemoryAnsPage({
    super.key,
  });

  static const path = '/recent_memory_ans';

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentMemoryPageState();
}

class _RecentMemoryPageState extends ConsumerState<RecentMemoryAnsPage> {
  final controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
    for (final controller in controllers) {
      controller.addListener(() {
        setState(() {});
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
    for (final controller in controllers) {
      controller.dispose();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('一番はじめに入力した今買いたいと思っているものを3つ入力してください。'),
                const Gap(16),
                for (var i = 0; i < 3; i++)
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextFormField(
                      controller: controllers[i],
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                const Gap(16),
                ElevatedButton(
                  onPressed: controllers
                          .any((controller) => controller.text.isEmpty)
                      ? null
                      : () async {
                          try {
                            ref.read(recentMemoryProvider.notifier).state =
                                ref.read(recentMemoryProvider)?.copyWith(
                                      finishedAt: DateTime.now(),
                                      answerList: controllers
                                          .map((controller) => controller.text)
                                          .toList(),
                                    );

                            final recentMemoryLog =
                                ref.read(recentMemoryProvider);

                            await FirebaseFirestore.instance
                                .collection('recent_memory_log')
                                .add(recentMemoryLog!.toJson());
                          } finally {
                            if (context.mounted) {
                              context.go(HomePage.path);
                            }
                          }
                        },
                  child: const Text('決定'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

final recentMemoryProvider = StateProvider<RecentMemoryLog?>((ref) {
  return null;
});
