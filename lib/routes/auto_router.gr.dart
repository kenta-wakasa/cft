// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i5;
import 'package:cft/home/home_page.dart' as _i1;
import 'package:cft/login/login_page.dart' as _i2;
import 'package:cft/persistence_attention/persistence_attention_page.dart'
    as _i3;
import 'package:cft/select_attention/select_attention_page.dart' as _i4;

abstract class $AppRouter extends _i5.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i5.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.LoginPage(),
      );
    },
    PersistenceAttentionRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.PersistenceAttentionPage(),
      );
    },
    SelectAttentionRoute.name: (routeData) {
      return _i5.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SelectAttentionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i5.PageRouteInfo<void> {
  const HomeRoute({List<_i5.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i2.LoginPage]
class LoginRoute extends _i5.PageRouteInfo<void> {
  const LoginRoute({List<_i5.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i3.PersistenceAttentionPage]
class PersistenceAttentionRoute extends _i5.PageRouteInfo<void> {
  const PersistenceAttentionRoute({List<_i5.PageRouteInfo>? children})
      : super(
          PersistenceAttentionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersistenceAttentionRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SelectAttentionPage]
class SelectAttentionRoute extends _i5.PageRouteInfo<void> {
  const SelectAttentionRoute({List<_i5.PageRouteInfo>? children})
      : super(
          SelectAttentionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAttentionRoute';

  static const _i5.PageInfo<void> page = _i5.PageInfo<void>(name);
}
