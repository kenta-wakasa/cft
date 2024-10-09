import 'package:cft/home/home_page.dart';
import 'package:cft/immediate_memory/immediate_memory_page.dart';
import 'package:cft/login/login_page.dart';
import 'package:cft/performance/performance_page.dart';
import 'package:cft/persistence_attention/persistence_attention_page.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:cft/semantic_fluency/semantic_fluency_page.dart';
import 'package:cft/semantic_understanding.dart/semantic_understanding_for_meaning_page.dart';
import 'package:cft/test_log/test_log_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouteProvider = Provider((ref) {
  return GoRouter(
    initialLocation: HomePage.path,
    redirect: (context, state) {
      if (state.fullPath == LoginPage.path) {
        return null;
      }
      if (FirebaseAuth.instance.currentUser == null) {
        return LoginPage.path;
      }
      return null;
    },
    routes: [
      GoRoute(
        path: HomePage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: HomePage()),
      ),

      /// LoginPage
      GoRoute(
        path: LoginPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: LoginPage()),
      ),

      GoRoute(
        path: TestLogPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: TestLogPage()),
      ),

      GoRoute(
        path: SelectAttentionPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SelectAttentionPage()),
      ),

      GoRoute(
        path: SemanticFluencyPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SemanticFluencyPage()),
      ),

      GoRoute(
        path: PersistenceAttentionPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: PersistenceAttentionPage()),
      ),

      GoRoute(
        path: SelectAttentionPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: SelectAttentionPage()),
      ),

      GoRoute(
        path: ImmediateMemoryPage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: ImmediateMemoryPage()),
      ),

      GoRoute(
        path: PerformancePage.path,
        pageBuilder: (context, state) =>
            const NoTransitionPage(child: PerformancePage()),
      ),

      GoRoute(
        path: SemanticUnderstandingForMeaningPage.path,
        pageBuilder: (context, state) => const NoTransitionPage(
            child: SemanticUnderstandingForMeaningPage()),
      ),
    ],
  );
});
