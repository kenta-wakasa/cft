import 'package:auto_route/auto_route.dart';
import 'package:cft/auth/firebase_auth.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

@RoutePage()
class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final uid = ref.watch(uidProvider);
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
            Text('uid: $uid'),
            ElevatedButton(
              onPressed: () {},
              child: const Text('ほげ'),
            ),
            const Text('home'),
          ],
        ),
      ),
    );
  }
}
