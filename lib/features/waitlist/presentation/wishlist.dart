import 'package:tezda/core/components/app_bar.dart';
import 'package:tezda/core/components/components.dart';
import 'package:tezda/core/resources/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WaitlistPage extends StatefulWidget {
  const WaitlistPage({super.key});

  @override
  WaitlistPageState createState() => WaitlistPageState();
}

class WaitlistPageState extends State<WaitlistPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: "Wishlist",
        press: false,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppIcon.emptyWaitlist),
            S.h(28),
            AppText(
              text: "Nothing Here",
              size: 36,
              weight: FontWeight.w700,
              color: ColorPalette.black400,
            ),
            S.h(8),
            AppText(
              text:
                  "Create a Wishlist where you can save products and revisit your favorite items",
              size: 16,
              weight: FontWeight.w700,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
