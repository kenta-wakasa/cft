import 'package:cft/common/common_app_bar.dart';
import 'package:cft/home/home_page.dart';
import 'package:cft/immediate_memory/immediate_memory_page.dart';
import 'package:cft/recent_memory/recent_memory_log.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class RecentMemoryPage extends ConsumerStatefulWidget {
  const RecentMemoryPage({
    super.key,
    required this.nextPath,
  });

  final String? nextPath;

  static const path = '/recent_memory';

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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text('今買いたいと思っているものを3つ入力してください。'),
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
                          : () {
                              ref.read(recentMemoryProvider.notifier).state =
                                  RecentMemoryLog(
                                uid: FirebaseAuth.instance.currentUser!.uid,
                                createdAt: DateTime.now(),
                                memoryList: controllers
                                    .map((controller) => controller.text)
                                    .toList(),
                              );

                              if (widget.nextPath == null) {
                                context.go(HomePage.path);
                              } else {
                                context.go(
                                  '${widget.nextPath!}?nextPath=${ImmediateMemoryPage.path}',
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

final recentMemoryProvider = StateProvider<RecentMemoryLog?>((ref) {
  return null;
});
