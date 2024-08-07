import 'package:auto_route/auto_route.dart';
import 'package:cft/routes/auth_guard.dart';
import 'package:cft/routes/auto_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends $AppRouter {
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
      ];

  List<AutoRouteGuard> get guards => [
        AuthGuard(),
      ];
}
