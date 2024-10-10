import 'package:cft/home/home_page.dart';
import 'package:cft/immediate_memory/immediate_memory_page.dart';
import 'package:cft/login/login_page.dart';
import 'package:cft/performance/performance_page.dart';
import 'package:cft/persistence_attention/persistence_attention_page.dart';
import 'package:cft/recent_memory/recent_memory_ans_page.dart';
import 'package:cft/recent_memory/recent_memory_page.dart';
import 'package:cft/select_attention/select_attention_page.dart';
import 'package:cft/semantic_fluency/semantic_fluency_page.dart';
import 'package:cft/semantic_understanding.dart/semantic_understanding_for_calculation_page.dart';
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
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
            child: SelectAttentionPage(
              nextPath: nextPath,
            ),
          );
        },
      ),

      GoRoute(
        path: SemanticFluencyPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
              child: SemanticFluencyPage(
            nextPath: nextPath,
          ));
        },
      ),

      GoRoute(
        path: PersistenceAttentionPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
            child: PersistenceAttentionPage(
              nextPath: nextPath,
            ),
          );
        },
      ),

      GoRoute(
        path: SelectAttentionPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
              child: SelectAttentionPage(
            nextPath: nextPath,
          ));
        },
      ),

      GoRoute(
        path: ImmediateMemoryPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
              child: ImmediateMemoryPage(
            nextPath: nextPath,
          ));
        },
      ),

      GoRoute(
        path: PerformancePage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
              child: PerformancePage(
            nextPath: nextPath,
          ));
        },
      ),

      GoRoute(
        path: SemanticUnderstandingForMeaningPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
              child: SemanticUnderstandingForMeaningPage(
            nextPath: nextPath,
          ));
        },
      ),

      GoRoute(
        path: SemanticUnderstandingForCalculationPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
            child: SemanticUnderstandingForCalculationPage(nextPath: nextPath),
          );
        },
      ),

      GoRoute(
        path: RecentMemoryPage.path,
        pageBuilder: (context, state) {
          final nextPath = state.uri.queryParameters['nextPath'];
          return NoTransitionPage(
            child: RecentMemoryPage(nextPath: nextPath),
          );
        },
      ),

      GoRoute(
        path: RecentMemoryAnsPage.path,
        pageBuilder: (context, state) {
          return const NoTransitionPage(
            child: RecentMemoryAnsPage(),
          );
        },
      ),
    ],
  );
});
