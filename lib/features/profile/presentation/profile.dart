import 'package:provider/provider.dart';
import 'package:tezda/core/components/app_text.dart';
import 'package:tezda/core/components/apply_button.dart';
import 'package:tezda/core/components/notification.dart';
import 'package:tezda/core/plugins/plugins.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/auth/presentation/login.dart';
import 'package:tezda/features/auth/presentation/register.dart';
import 'package:tezda/features/profile/presentation/about_us.dart';
import 'package:tezda/features/profile/presentation/edit_profile.dart';
import 'package:tezda/features/profile/presentation/help_center.dart';
import 'package:tezda/features/profile/presentation/privacy_policy.dart';
import 'package:tezda/features/profile/presentation/terms_of_use.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezda/features/profile/provider/profile_provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  ProfilePageState createState() => ProfilePageState();
}

class ProfilePageState extends State<ProfilePage> {
  Future<bool?>? _isLoggedIn;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<ProfileProvider>(context, listen: false).getUser(id: 1);
    });
    _isLoggedIn = Plugins.getUserLoggedInStatus();
  }

  Future<void> _logout() async {
    final logout = await Plugins.logOutUser();
    if (logout) {
      // ignore: use_build_context_synchronously
      FlushBarNotification.showSuccess(
              context: context, message: "Logout successful")
          .then((value) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => const LoginPage(),
          ),
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: ColorPalette.white,
          body: _isLoggedIn == null
              ? Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 87,
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      AppText(
                        text: "Personalize your Shopping Experience",
                        size: 30,
                        weight: FontWeight.w700,
                        color: ColorPalette.black,
                      ),
                      S.h(8),
                      AppText(
                        text:
                            "Create a Profile and Get access to exclusive offers and more.",
                        size: 16,
                        weight: FontWeight.w400,
                      ),
                      S.h(64),
                      ApplyButton(
                        text: "Login",
                        boderColor: ColorPalette.primary,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const LoginPage(),
                            ),
                          );
                        },
                        backgroundColor: ColorPalette.primary,
                        textColor: ColorPalette.white,
                      ),
                      S.h(10),
                      ApplyButton(
                        text: "Sign Up",
                        boderColor: ColorPalette.primary,
                        press: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const RegisterPage(),
                            ),
                          );
                        },
                        backgroundColor: ColorPalette.white,
                        textColor: ColorPalette.primary,
                      )
                    ],
                  ),
                )
              : provider.loading
                  ? const Center(
                      child: CircularProgressIndicator(
                        strokeWidth: 1,
                        color: ColorPalette.primary,
                      ),
                    )
                  : Column(
                      children: [
                        Container(
                          width: double.infinity,
                          height: 255,
                          color: ColorPalette.primary,
                          child: Column(
                            children: [
                              S.h(67),
                              Container(
                                width: 80,
                                height: 80,
                                decoration: const BoxDecoration(
                                  color: ColorPalette.white,
                                  shape: BoxShape.circle,
                                ),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: AppText(
                                    text: "HJ",
                                    color: ColorPalette.primary,
                                    size: 30,
                                    weight: FontWeight.w700,
                                  ),
                                ),
                              ),
                              S.h(17),
                              AppText(
                                text:
                                    "${provider.currentUser?.name.firstname} ${provider.currentUser?.name.lastname}",
                                color: ColorPalette.white,
                                size: 30,
                                weight: FontWeight.w700,
                              ),
                              S.h(8),
                              AppText(
                                text: provider.currentUser?.email ?? "",
                                color: ColorPalette.white,
                                size: 16,
                                weight: FontWeight.w400,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "General",
                                    color: ColorPalette.black,
                                    size: 16,
                                    weight: FontWeight.w700,
                                    textAlign: TextAlign.left,
                                  ),
                                  S.h(16),
                                  ProfileTabs(
                                    title: "Profile  and Preferences",
                                    icon: AppIcon.userSquare,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const EditProfilePage(),
                                        ),
                                      );
                                    },
                                  ),
                                  ProfileTabs(
                                    title: "Product listing and Manage Orders",
                                    icon: AppIcon.truck,
                                    press: () {},
                                  ),
                                  ProfileTabs(
                                    title: "Discount",
                                    icon: AppIcon.message,
                                    press: () {},
                                  ),
                                  S.h(16),
                                  AppText(
                                    text: "Support",
                                    color: ColorPalette.black,
                                    size: 16,
                                    weight: FontWeight.w700,
                                    textAlign: TextAlign.left,
                                  ),
                                  S.h(16),
                                  ProfileTabs(
                                    title: "In App chat/customer care",
                                    icon: AppIcon.phone,
                                    press: () {},
                                  ),
                                  ProfileTabs(
                                    title: "Help Center",
                                    icon: AppIcon.info,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const HelpCenter(),
                                        ),
                                      );
                                    },
                                  ),
                                  ProfileTabs(
                                    title: "About Us",
                                    icon: AppIcon.groupOfPeople,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const AboutUsPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  S.h(16),
                                  AppText(
                                    text: "Policies",
                                    color: ColorPalette.black,
                                    size: 16,
                                    weight: FontWeight.w700,
                                    textAlign: TextAlign.left,
                                  ),
                                  S.h(16),
                                  ProfileTabs(
                                    title: "Terms of Use",
                                    icon: AppIcon.documentBendUp,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const TermsOfUsePage(),
                                        ),
                                      );
                                    },
                                  ),
                                  ProfileTabs(
                                    title: "Privacy Policy",
                                    icon: AppIcon.userShiled,
                                    press: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (BuildContext context) =>
                                              const PrivacyPolicyPage(),
                                        ),
                                      );
                                    },
                                  ),
                                  S.h(14),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 8),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(
                                            10.0), // Adjust the radius value as needed
                                        color: ColorPalette
                                            .foundationGray, // Specify the background color of the container
                                      ),
                                      child: ListTile(
                                        title: AppText(
                                          text: "Logout",
                                          color: ColorPalette.red,
                                          size: 16,
                                          weight: FontWeight.w400,
                                        ),
                                        leading: SvgPicture.asset(
                                          AppIcon.logout,
                                          // ignore: deprecated_member_use
                                          color: ColorPalette.red,
                                        ),
                                        trailing: const Icon(
                                          Icons.arrow_forward_ios,
                                          color: ColorPalette.black,
                                          size: 24,
                                        ),
                                        onTap: () {
                                          _logout();
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
        );
      },
    );
  }
}

class ProfileTabs extends StatelessWidget {
  final String title;
  final String icon;
  final Function press;
  final Color allColor;

  const ProfileTabs({
    required this.title,
    required this.icon,
    required this.press,
    this.allColor = ColorPalette.black,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius:
              BorderRadius.circular(10.0), // Adjust the radius value as needed
          color: ColorPalette
              .foundationGray, // Specify the background color of the container
        ),
        child: ListTile(
          title: AppText(
            text: title,
            color: ColorPalette.black,
            size: 16,
            weight: FontWeight.w400,
          ),
          leading: SvgPicture.asset(
            icon,
            // ignore: deprecated_member_use
            color: ColorPalette.black,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: ColorPalette.black,
            size: 24,
          ),
          onTap: press as void Function(),
        ),
      ),
    );
  }
}
