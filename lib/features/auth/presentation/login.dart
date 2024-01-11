// ignore_for_file: use_build_context_synchronously

import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/components/notification.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/auth/provider/auth_provider.dart';
import 'package:tezda/features/auth/presentation/register.dart';
import 'package:tezda/features/home/presentation/landing.dart';
import 'package:tezda/main.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = "/loginPage";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(builder: (context, provider, child) {
      return Scaffold(
          body: provider.loading
              ? const Center(
                  child: CircularProgressIndicator(
                    strokeWidth: 1,
                    color: ColorPalette.primary,
                  ),
                )
              : SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      top: 170,
                      right: 16,
                      left: 16,
                    ),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Image.asset(
                            AppImage.logo,
                            width: 150,
                          ),
                        ),
                        S.h(10),
                        AppText(
                          text: "Login in to your account to start shopping",
                          weight: FontWeight.w400,
                          size: 14,
                        ),
                        S.h(18),
                        FormFieldData(
                          controller: _emailController,
                          title: "Username",
                          hintText: "tezda",
                          prefix: true,
                          prefixString: AppIcon.sms,
                        ),
                        FormFieldData(
                          controller: _passwordController,
                          title: "Password",
                          hintText: "Enter Password",
                          prefix: true,
                          prefixString: AppIcon.padlock,
                        ),
                        // S.h(8),
                        // Align(
                        //   alignment: Alignment.topRight,
                        //   child: GestureDetector(
                        //     onTap: () {
                        //       Navigator.push(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (BuildContext context) =>
                        //               const ForgetPasswordPage(),
                        //         ),
                        //       );
                        //     },
                        //     child: AppText(
                        //       text: "Forgotten password?",
                        //       weight: FontWeight.w700,
                        //       size: 16,
                        //       color: ColorPalette.primary,
                        //     ),
                        //   ),
                        // ),
                        S.h(24),
                        ApplyButton(
                          text: "Login",
                          boderColor: ColorPalette.primary,
                          press: () {
                            if (_emailController.text.isEmpty ||
                                _passwordController.text.isEmpty) {
                              FlushBarNotification.showError(
                                  context: context,
                                  message: 'All fields are required');
                            } else {
                              provider
                                  .login(
                                      username: _emailController.text.trim(),
                                      password: _passwordController.text.trim())
                                  .then((value) async {
                                await provider.getUser(id: 1);

                                if (value) {
                                  showToast(context, 'Login successful chief');
                                  // FlushBarNotification.showSuccess(
                                  //     context: context,
                                  //     message: 'Login successful chief');
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LandingPage(),
                                    ),
                                  );
                                } else {
                                  FlushBarNotification.showError(
                                      context: context,
                                      message: provider.error);
                                }
                              }).catchError((error) {
                                FlushBarNotification.showError(
                                    context: context, message: error);
                                // showToast(context, 'An error occurred during signing in');
                              });
                            }
                          },
                          backgroundColor: ColorPalette.primary,
                          textColor: ColorPalette.white,
                        ),
                        S.h(16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            AppText(
                              text: "Don't have an account? ",
                              weight: FontWeight.w400,
                              size: 16,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  RegisterPage.routeName,
                                );
                              },
                              child: AppText(
                                text: "Register",
                                weight: FontWeight.w700,
                                size: 16,
                                color: ColorPalette.primary,
                              ),
                            ),
                          ],
                        ),
                        S.h(40),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: ColorPalette.gray1,
                              ),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 17),
                              child: AppText(
                                text: "OR",
                                weight: FontWeight.w400,
                                size: 16,
                                color: ColorPalette.gray1,
                              ),
                            ),
                            const Expanded(
                              child: Divider(
                                thickness: 1.5,
                                color: ColorPalette.gray1,
                              ),
                            ),
                          ],
                        ),
                        S.h(36),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset(
                              AppImage.google,
                              width: 64,
                            ),
                            S.w(24),
                            Image.asset(
                              AppImage.facebook,
                              width: 64,
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ));
    });
  }
}
