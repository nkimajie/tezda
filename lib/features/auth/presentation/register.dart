import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/components/notification.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/auth/presentation/login.dart';
import 'package:tezda/features/auth/provider/auth_provider.dart';
import 'package:tezda/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static String routeName = "/registerPage";

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _firstnameController = TextEditingController();
  final TextEditingController _lastnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<AuthProvider>(
      builder: (BuildContext context, provider, Widget? child) {
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
                      child: Form(
                        key: _formKey,
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
                              text: "Create your account to start shopping",
                              weight: FontWeight.w400,
                              size: 14,
                            ),
                            S.h(18),
                            Row(
                              children: [
                                Expanded(
                                  child: FormFieldData(
                                    controller: _firstnameController,
                                    title: "Firstname",
                                    hintText: "Enter firstname",
                                    prefix: true,
                                    prefixString: AppIcon.userSquare,
                                    validation: true,
                                  ),
                                ),
                                S.w(10),
                                Expanded(
                                  child: FormFieldData(
                                    controller: _lastnameController,
                                    title: "Lastname",
                                    hintText: "Enter lastname",
                                    prefix: true,
                                    prefixString: AppIcon.userSquare,
                                    validation: true,
                                  ),
                                ),
                              ],
                            ),
                            FormFieldData(
                              controller: _usernameController,
                              title: "Username",
                              hintText: "Enter username",
                              prefix: true,
                              prefixString: AppIcon.userShiled,
                              validation: true,
                            ),
                            FormFieldData(
                              controller: _emailController,
                              title: "Email",
                              hintText: "tezda@gmail.com",
                              prefix: true,
                              prefixString: AppIcon.sms,
                              validation: true,
                            ),
                            FormFieldData(
                              controller: _passwordController,
                              title: "Password",
                              hintText: "Create Password",
                              prefix: true,
                              prefixString: AppIcon.padlock,
                              validation: true,
                            ),
                            S.h(24),
                            ApplyButton(
                              text: "Sign up",
                              boderColor: ColorPalette.primary,
                              press: () {
                                if (_formKey.currentState!.validate()) {
                                  provider
                                      .register(
                                          firstname:
                                              _firstnameController.text.trim(),
                                          lastname:
                                              _lastnameController.text.trim(),
                                          username:
                                              _usernameController.text.trim(),
                                          email: _emailController.text.trim(),
                                          password:
                                              _passwordController.text.trim())
                                      .then((value) {
                                    if (value) {
                                      showToast(context,
                                          'Registration successful please login');
                                      // FlushBarNotification.showSuccess(
                                      //     context: context,
                                      //     message:
                                      //         'Registration successful please login');
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const LoginPage(),
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
                                } else {
                                  FlushBarNotification.showError(
                                      context: context,
                                      message: 'All fields are required');
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
                                  text: "Already have an account? ",
                                  weight: FontWeight.w400,
                                  size: 16,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      LoginPage.routeName,
                                    );
                                  },
                                  child: AppText(
                                    text: "Login",
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 17),
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
                                S.h(24),
                                Image.asset(
                                  AppImage.facebook,
                                  width: 64,
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ));
      },
    );
  }
}
