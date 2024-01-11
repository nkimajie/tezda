import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  double size;
  final String text;
  final Color color;
  final FontWeight weight;
  final TextAlign textAlign;
  final TextDecoration textDecoration;
  final TextOverflow? textOverflow;

  AppText({
    Key? key,
    this.size = 16,
    required this.text,
    this.color = Colors.black,
    this.textAlign = TextAlign.start,
    this.weight = FontWeight.w500,
    this.textDecoration = TextDecoration.none,
    this.textOverflow = TextOverflow.clip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
        fontFamily: 'HeyWow',
        decoration: textDecoration,
        overflow: textOverflow,
      ),
    );
  }
}
