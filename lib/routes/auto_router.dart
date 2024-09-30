import 'package:auto_route/auto_route.dart';
import 'package:cft/routes/auth_guard.dart';
import 'package:cft/routes/auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: HomeRoute.page,
          path: '/',
          initial: true,
          guards: guards,
        ),
        AutoRoute(
          page: PersistenceAttentionRoute.page,
          path: '/persistence_attention',
          guards: guards,
        ),
        AutoRoute(
          page: SelectAttentionRoute.page,
          path: '/select_attention',
          guards: guards,
        ),
        AutoRoute(
          page: ImmediateMemoryRoute.page,
          path: '/immediate_memory',
          guards: guards,
        ),
        AutoRoute(
          page: TestLogRoute.page,
          path: '/test_log',
          guards: guards,
        ),
        AutoRoute(
          page: SemanticFluencyRoute.page,
          path: '/semantic_fluency',
          guards: guards,
        ),
        AutoRoute(
          page: PerformanceRoute.page,
          path: '/performance',
          guards: guards,
        ),
      ];

  @override
  List<AutoRouteGuard> get guards => [
        AuthGuard(),
      ];
}
