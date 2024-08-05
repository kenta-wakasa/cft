import 'package:auto_route/auto_route.dart';
import 'package:cft/routes/auto_router.gr.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final authenticated = FirebaseAuth.instance.currentUser != null;
    if (authenticated) {
      resolver.next(true);
    } else {
      resolver.redirect(
        const LoginRoute(),
      );
    }
  }
}
