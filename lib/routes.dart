import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';
import 'package:scalable_flutter/features/login_screen/login_screen.dart';
import 'package:scalable_flutter/features/signup_screen/signup_screen.dart';
import 'package:scalable_flutter/features/splash_screen/splash_screen.dart';

final router = GoRouter(
  initialLocation: LoginScreen.routeLocation,
  routes: [
    GoRoute(
      path: SplashScreen.routeLocation,
      name: SplashScreen.routeName,
      builder: (_, __) => const SplashScreen(),
    ),
    GoRoute(
      path: LoginScreen.routeLocation,
      name: LoginScreen.routeName,
      builder: (context, __) => LoginScreen(
        onGotoSignup: () {
          context.goNamed(SignupScreen.routeName);
        },
        onLogin: (email, password) {
          debugPrint('Login $email, $password');
        },
      ),
    ),
    GoRoute(
      path: SignupScreen.routeLocation,
      name: SignupScreen.routeName,
      builder: (context, __) => SignupScreen(
        onGotoLogin: () {
          context.goNamed(LoginScreen.routeName);
        },
        onSignup: (name, email, password) {
          debugPrint('name: $name, email: $email, password: $password');
        },
      ),
    ),
  ],
);
