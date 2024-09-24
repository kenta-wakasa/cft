import 'package:auto_route/auto_route.dart';
import 'package:cft/auth/firebase_auth.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(uidProvider);
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
              context.router.replace(const LoginRoute());
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: Center(
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
                        context.router.replace(const TestLogRoute());
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
                  context.router.replace(const PersistenceAttentionRoute());
                },
                child: const Text('持続性注意'),
              ),
            ),

            const Gap(16),

            /// 選択制注意
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  context.router.replace(const SelectAttentionRoute());
                },
                child: const Text('選択性注意'),
              ),
            ),

            const Gap(16),

            /// 即時記憶
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  context.router.replace(const ImmediateMemoryRoute());
                },
                child: const Text('即時記憶'),
              ),
            ),

            const Gap(16),

            /// 意味流調性
            SizedBox(
              width: 160,
              child: ElevatedButton(
                onPressed: () {
                  context.router.replace(const SemanticFluencyRoute());
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
                  context.router.replace(const PerformanceRoute());
                },
                child: const Text('遂行・計画変更'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
