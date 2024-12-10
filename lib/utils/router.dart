import 'dart:developer';

import 'package:go_router/go_router.dart';
import 'package:hive/hive.dart';
import 'package:oncampus/constants/hive.const.dart';
import 'package:oncampus/models/user.model.dart';

import '../pages/Authentication/login_page.dart';
import '../pages/Authentication/register_page.dart';
import '../pages/Home/main_home_page.dart';
import '../pages/Authentication/otp_verification_page.dart';

final router = GoRouter(
  redirect: (context, state) {
    final user = Hive.box(config).get(currentUser) as User?;
    log('Navigating to: ${state.fullPath}');
    log('User: ${user?.toJson()}');

    // No user logged in
    if (user == null) {
      if (state.matchedLocation != LoginPage.route &&
          state.matchedLocation != RegisterPage.route) {
        return LoginPage.route;
      }
      return null; // Allow navigation to LoginPage or RegisterPage
    }

    // User exists but not active
    if (!user.isActive) {
      if (state.matchedLocation != OTPVerificationPage.route) {
        log("User is not active, redirecting to OTPVerificationPage");
        return OTPVerificationPage.route;
      }
      return null; // Allow navigation to OTPVerificationPage
    }

    // User is active
    if ([LoginPage.route, RegisterPage.route, OTPVerificationPage.route]
        .contains(state.matchedLocation)) {
      log("User is active, redirecting to MainHomePage");
      return MainHomePage.route;
    }

    return null; // No redirection
  },
  initialLocation: LoginPage.route,
  initialExtra: {"index": 0},
  routes: [
    GoRoute(
      path: RegisterPage.route,
      builder: (context, state) => const RegisterPage(),
    ),
    GoRoute(
      path: LoginPage.route,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: MainHomePage.route,
      builder: (context, state) => MainHomePage(
          index: state.extra != null
              ? ((state.extra as Map<String, dynamic>)['index'] ?? 0)
              : 0),
    ),
    GoRoute(
      path: OTPVerificationPage.route,
      builder: (context, state) => const OTPVerificationPage(),
    ),
  ],
);
