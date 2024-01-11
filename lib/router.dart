import 'package:tezda/features/auth/presentation/login.dart';
import 'package:tezda/features/auth/presentation/register.dart';
import 'package:tezda/features/home/presentation/landing.dart';
import 'package:tezda/features/onboarding/splash.dart';
import 'package:flutter/widgets.dart';

final Map<String, WidgetBuilder> routes = {
  LoginPage.routeName: (context) => const LoginPage(),
  RegisterPage.routeName: (context) => const RegisterPage(),
  LandingPage.routeName: (context) => const LandingPage(),
  SplashPage.routeName: (context) => const SplashPage(),
};
