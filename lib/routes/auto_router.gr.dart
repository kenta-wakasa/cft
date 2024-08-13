// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:cft/home/home_page.dart' as _i1;
import 'package:cft/immediate_memory/immediate_memory_page.dart' as _i2;
import 'package:cft/login/login_page.dart' as _i3;
import 'package:cft/persistence_attention/persistence_attention_page.dart'
    as _i4;
import 'package:cft/select_attention/select_attention_page.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomePage(),
      );
    },
    ImmediateMemoryRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.ImmediateMemoryPage(),
      );
    },
    LoginRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.LoginPage(),
      );
    },
    PersistenceAttentionRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.PersistenceAttentionPage(),
      );
    },
    SelectAttentionRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SelectAttentionPage(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomePage]
class HomeRoute extends _i6.PageRouteInfo<void> {
  const HomeRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.ImmediateMemoryPage]
class ImmediateMemoryRoute extends _i6.PageRouteInfo<void> {
  const ImmediateMemoryRoute({List<_i6.PageRouteInfo>? children})
      : super(
          ImmediateMemoryRoute.name,
          initialChildren: children,
        );

  static const String name = 'ImmediateMemoryRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.LoginPage]
class LoginRoute extends _i6.PageRouteInfo<void> {
  const LoginRoute({List<_i6.PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.PersistenceAttentionPage]
class PersistenceAttentionRoute extends _i6.PageRouteInfo<void> {
  const PersistenceAttentionRoute({List<_i6.PageRouteInfo>? children})
      : super(
          PersistenceAttentionRoute.name,
          initialChildren: children,
        );

  static const String name = 'PersistenceAttentionRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SelectAttentionPage]
class SelectAttentionRoute extends _i6.PageRouteInfo<void> {
  const SelectAttentionRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SelectAttentionRoute.name,
          initialChildren: children,
        );

  static const String name = 'SelectAttentionRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
