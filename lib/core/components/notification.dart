import 'package:tezda/core/resources/resources.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';

class FlushBarNotification {
  static Future<void> showError({
    required BuildContext context,
    required String message,
  }) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.red,
      borderRadius: BorderRadius.circular(7),
      mainButton: const Icon(
        Icons.cancel,
        color: ColorPalette.white,
      ),
      icon: const Icon(
        Icons.warning,
        color: ColorPalette.white,
      ),
    ).show(context);
  }

  static Future<void> showWarning({
    required BuildContext context,
    required String message,
  }) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      messageColor: ColorPalette.black400,
      duration: const Duration(seconds: 3),
      backgroundColor: Colors.yellowAccent,
      borderRadius: BorderRadius.circular(7),
      mainButton: const Icon(
        Icons.cancel,
        color: ColorPalette.black400,
      ),
      icon: const Icon(
        Icons.warning,
        color: ColorPalette.black400,
      ),
    ).show(context);
  }

  static Future<void> showSuccess({
    required BuildContext context,
    required String message,
  }) {
    return Flushbar(
      flushbarPosition: FlushbarPosition.TOP,
      padding: const EdgeInsets.fromLTRB(20, 10, 10, 10),
      margin: const EdgeInsets.symmetric(horizontal: 20),
      message: message,
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.green,
      borderRadius: BorderRadius.circular(7),
      mainButton: const Icon(
        Icons.cancel,
        color: ColorPalette.white,
      ),
      icon: const Icon(
        Icons.check_circle,
        color: ColorPalette.white,
      ),
    ).show(context);
  }

  // static dynamic showInfoMessage({
  //   required BuildContext context,
  //   String title = '',
  //   required String message,
  // }) {
  //   FlushbarHelper.createInformation(
  //     message: message,
  //     title: title,
  //   ).show(context);
  // }
}
