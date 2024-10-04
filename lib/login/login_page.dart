import 'package:cft/home/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  static const path = '/login';

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {
  Future<void> login() async {
    final email = emailController.text;
    final password = passwordController.text;
    final context = this.context;

    if (email.isEmpty || password.isEmpty) {
      return;
    }

    final userCredential =
        await FirebaseAuth.instance.signInWithEmailAndPassword(
      email: email,
      password: password,
    );

    if (userCredential.user == null) {
      return;
    }

    if (!context.mounted) {
      return;
    }
    context.go(HomePage.path);
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 480,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                '認知機能トレーニング',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Gap(48),
              TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'メールアドレス',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(16),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'パスワード',
                  border: OutlineInputBorder(),
                ),
              ),
              const Gap(16),
              ElevatedButton(
                onPressed: login,
                child: const Text('ログイン'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
