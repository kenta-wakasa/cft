import 'package:cft/home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecentMemoryAnsPage extends ConsumerStatefulWidget {
  const RecentMemoryAnsPage({
    super.key,
    required this.id,
  });

  static const path = '/recent_memory_ans';

  final String? id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentMemoryPageState();
}

class _RecentMemoryPageState extends ConsumerState<RecentMemoryAnsPage> {
  final controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection('recent_memory_log')
        .doc(widget.id)
        .set(
      {
        'ansStartedAt': DateTime.now().toIso8601String(),
      },
      SetOptions(merge: true),
    );
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
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text('一番はじめに入力した、今ほしいものか、したいことを優先順位の高いものから順に5つ入力してください'),
                const Gap(16),
                for (var i = 0; i < 5; i++)
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
                            await FirebaseFirestore.instance
                                .collection('recent_memory_log')
                                .doc(widget.id)
                                .set({
                              'answerList':
                                  controllers.map((e) => e.text).toList(),
                              'finishedAt': DateTime.now().toIso8601String(),
                            }, SetOptions(merge: true));
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
