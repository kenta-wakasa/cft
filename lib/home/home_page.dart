import 'package:cft/auth/firebase_auth.dart';
import 'package:cft/immediate_memory/immediate_memory_page.dart';
import 'package:cft/login/login_page.dart';
import 'package:cft/performance/performance_page.dart';
import 'package:cft/persistence_attention/persistence_attention_page.dart';
import 'package:cft/recent_memory/recent_memory_page.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:cft/semantic_fluency/semantic_fluency_page.dart';
import 'package:cft/semantic_understanding.dart/semantic_understanding_for_calculation_page.dart';
import 'package:cft/semantic_understanding.dart/semantic_understanding_for_meaning_page.dart';
import 'package:cft/test_log/test_log_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:uuid/v6.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  static const path = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(isAdminProvider);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await ref.read(firebaseAuthProvider).signOut();
              if (!context.mounted) {
                return;
              }
              context.go(LoginPage.path);
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (isAdmin)
                  Column(
                    children: [
                      const Text('管理者モード'),
                      const Gap(16),
                      SizedBox(
                        width: 160,
                        child: ElevatedButton(
                          onPressed: () {
                            context.go(TestLogPage.path);
                          },
                          child: const Text('テストログ'),
                        ),
                      ),
                      const Gap(32),
                    ],
                  ),

                const Gap(32),
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(
                          '${RecentMemoryPage.path}?nextPath=${PersistenceAttentionPage.path}&id=${const UuidV6().generate()}');
                    },
                    child: const Text('通し実験'),
                  ),
                ),

                const Gap(16),

                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(PersistenceAttentionPage.path);
                    },
                    child: const Text('持続性注意'),
                  ),
                ),

                const Gap(16),

                /// 即時記憶
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(ImmediateMemoryPage.path);
                    },
                    child: const Text('即時記憶'),
                  ),
                ),

                const Gap(16),

                /// 選択制注意
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(SelectAttentionPage.path);
                    },
                    child: const Text('選択性注意'),
                  ),
                ),

                const Gap(16),

                /// 意味理解
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(SemanticUnderstandingForMeaningPage.path);
                    },
                    child: const Text('意味理解・意味'),
                  ),
                ),

                const Gap(16),

                /// 意味理解
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(SemanticUnderstandingForCalculationPage.path);
                    },
                    child: const Text('意味理解・計算'),
                  ),
                ),

                const Gap(16),

                /// 意味流調性
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(SemanticFluencyPage.path);
                    },
                    child: const Text('意味流暢性'),
                  ),
                ),
                const Gap(16),

                /// 遂行・計画変更
                SizedBox(
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () {
                      context.go(PerformancePage.path);
                    },
                    child: const Text('遂行・計画変更'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
