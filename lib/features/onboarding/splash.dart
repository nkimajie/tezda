// ignore_for_file: use_build_context_synchronously

import 'package:tezda/core/components/app_text.dart';
import 'package:tezda/core/plugins/plugins.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/auth/presentation/login.dart';
import 'package:tezda/features/home/presentation/landing.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});
  static String routeName = "/splashPage";

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      bool status = await Plugins.getUserLoggedInStatus() ?? false;
      if (status) {
        Navigator.pushNamed(context, LandingPage.routeName);
      } else {
        Navigator.pushNamed(context, LoginPage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorPalette.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              AppImage.logo,
              width: 200,
            ),
            S.h(10),
            AppText(
              text: "No 1 shop for amazing products.",
              weight: FontWeight.w400,
              size: 14,
            ),
          ],
        ),
      ),
    );
  }
}
