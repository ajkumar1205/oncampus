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
    if (state.fullPath == RegisterPage.route) {
      final user = Hive.box(config).get(currentUser) as User?;

      if (user == null) {
        return RegisterPage.route;
      }

      if (user.isActive) {
        return MainHomePage.route;
      } else {
        return OTPVerificationPage.route;
      }
    }

    return null;
  },
  initialLocation: RegisterPage.route,
  // initialExtra: {"index": 0},
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
          index: (state.extra as Map<String, dynamic>)['index'] ?? 0),
    ),
    GoRoute(
      path: OTPVerificationPage.route,
      builder: (context, state) => const OTPVerificationPage(),
    ),
  ],
);
