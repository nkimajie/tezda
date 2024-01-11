import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tezda/core/resources/resources.dart';

class ApplyButton extends StatelessWidget {
  final String text;
  final Color? boderColor, backgroundColor, textColor, iconColor;
  final Function press;
  final bool hasIcon;
  final String? icon;
  final double height;
  final double width;
  const ApplyButton({
    Key? key,
    required this.text,
    required this.boderColor,
    required this.press,
    required this.backgroundColor,
    required this.textColor,
    this.iconColor,
    this.height = 50,
    this.width = double.infinity,
    this.hasIcon = false,
    this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: press as void Function()?,
        style: ElevatedButton.styleFrom(
          side: BorderSide(
            width: 1,
            color: boderColor!,
          ),
          backgroundColor: backgroundColor,
          elevation: 0.0,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          padding: const EdgeInsets.all(12),
        ),
        child: !hasIcon
            ? Center(
                child: Text(
                  text,
                  style: TextStyle(
                    color: textColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                    fontFamily: "Heynow",
                  ),
                ),
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    icon!,
                    // ignore: deprecated_member_use
                    color: iconColor,
                  ),
                  S.w(13),
                  Text(
                    text,
                    style: TextStyle(
                      color: textColor,
                      fontWeight: FontWeight.w700,
                      fontSize: 16,
                      fontFamily: "Heynow",
                    ),
                  )
                ],
              ),
      ),
    );
  }
}
