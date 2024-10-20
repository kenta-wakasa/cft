import 'package:cft/common/common_app_bar.dart';
import 'package:cft/home/home_page.dart';
import 'package:cft/immediate_memory/immediate_memory_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecentMemoryPage extends ConsumerStatefulWidget {
  const RecentMemoryPage({
    super.key,
    required this.nextPath,
    required this.id,
  });

  final String? nextPath;

  static const path = '/recent_memory';

  final String id;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecentMemoryPageState();
}

class _RecentMemoryPageState extends ConsumerState<RecentMemoryPage> {
  final controllers = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];

  @override
  void initState() {
    // TODO: implement initState
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
      appBar: widget.nextPath == null ? const CommonAppBar() : null,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                const Text(
                    '今買いたいと思っているものを3つ入力してください。実験の最後にもう一度聞きますので、入力した内容を覚えてください。'),
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
                  onPressed:
                      controllers.any((controller) => controller.text.isEmpty)
                          ? null
                          : () async {
                              await FirebaseFirestore.instance
                                  .collection('recent_memory_log')
                                  .doc(widget.id)
                                  .set({
                                'uid': FirebaseAuth.instance.currentUser!.uid,
                                'id': widget.id,
                                'createdAt': DateTime.now().toIso8601String(),
                                'memoryList': controllers
                                    .map((controller) => controller.text)
                                    .toList(),
                              });

                              if (widget.nextPath == null) {
                                context.go(HomePage.path);
                              } else {
                                context.go(
                                  '${widget.nextPath!}?nextPath=${ImmediateMemoryPage.path}&id=${widget.id}',
                                );
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
