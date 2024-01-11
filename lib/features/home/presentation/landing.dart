// ignore_for_file: deprecated_member_use

import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:tezda/features/cart/presentation/cart.dart';
import 'package:tezda/features/home/presentation/home.dart';
import 'package:tezda/features/profile/presentation/profile.dart';
import 'package:tezda/features/waitlist/presentation/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});
  static String routeName = "/landingPage";

  @override
  LandingPageState createState() => LandingPageState();
}

class LandingPageState extends State<LandingPage> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    const HomePage(),
    const CartPage(),
    const WaitlistPage(),
    const ProfilePage(),
  ];

  void onTappedBar(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        // backgroundColor: ColorPalette.white1,
        selectedItemColor: ColorPalette.white,
        // unselectedItemColor: ColorPalette.grey3,
        elevation: 0.0,
        onTap: onTappedBar,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(AppIcon.home),
                S.h(9),
                AppText(
                  text: "Home",
                  weight: FontWeight.w400,
                  size: 14,
                  color: ColorPalette.black400,
                ),
              ],
            ),
            label: '...',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  AppIcon.homeA,
                  color: ColorPalette.primary,
                ),
                AppText(
                  text: "Home",
                  weight: FontWeight.w700,
                  size: 14,
                  color: ColorPalette.primary,
                ),
                S.h(7),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: ColorPalette.primary,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(AppIcon.shoppingCart),
                S.h(9),
                AppText(
                  text: "Cart",
                  weight: FontWeight.w400,
                  size: 14,
                  color: ColorPalette.black400,
                ),
              ],
            ),
            label: '...',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  AppIcon.shoppingCartA,
                  color: ColorPalette.primary,
                ),
                AppText(
                  text: "Cart",
                  weight: FontWeight.w700,
                  size: 14,
                  color: ColorPalette.primary,
                ),
                S.h(7),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: ColorPalette.primary,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(AppIcon.heart),
                S.h(9),
                AppText(
                  text: "Wishlist",
                  weight: FontWeight.w400,
                  size: 14,
                  color: ColorPalette.black400,
                ),
              ],
            ),
            label: '...',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  AppIcon.heartA,
                  color: ColorPalette.primary,
                ),
                AppText(
                  text: "Wishlist",
                  weight: FontWeight.w700,
                  size: 14,
                  color: ColorPalette.primary,
                ),
                S.h(7),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: ColorPalette.primary,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                SvgPicture.asset(AppIcon.userSquare),
                S.h(9),
                AppText(
                  text: "Profile",
                  weight: FontWeight.w400,
                  size: 14,
                  color: ColorPalette.black400,
                ),
              ],
            ),
            label: '...',
            activeIcon: Column(
              children: [
                SvgPicture.asset(
                  AppIcon.userSquareA,
                  color: ColorPalette.primary,
                ),
                AppText(
                  text: "Profile",
                  weight: FontWeight.w700,
                  size: 14,
                  color: ColorPalette.primary,
                ),
                S.h(7),
                Container(
                  width: 4,
                  height: 4,
                  decoration: const BoxDecoration(
                    color: ColorPalette.primary,
                    shape: BoxShape.circle,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
