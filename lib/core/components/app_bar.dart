// ignore_for_file: must_be_immutable
import 'package:tezda/core/components/components.dart';
import 'package:flutter/material.dart';

import '../resources/resources.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  String title;
  bool press;
  Color? iconColor;
  Color? textColor;
  Color? backgroundColor;
  MyAppBar({
    super.key,
    required this.title,
    this.press = true,
    this.iconColor = ColorPalette.primary,
    this.textColor = ColorPalette.black,
    this.backgroundColor = ColorPalette.white,
  });

  @override
  Size get preferredSize => const Size.fromHeight(50);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: backgroundColor,
      leading: press
          ? GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Icon(
                  Icons.arrow_back_ios,
                  color: iconColor,
                ),
              ),
            )
          : null,
      elevation: 0.0,
      title: AppText(
        text: title,
        size: 24,
        weight: FontWeight.w700,
        color: textColor!,
      ),
    );
  }
}
