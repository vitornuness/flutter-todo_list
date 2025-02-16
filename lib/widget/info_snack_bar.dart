import 'package:flutter/material.dart';

class InfoSnackBar extends SnackBar {
  InfoSnackBar({
    super.key,
    required String message,
    super.duration = const Duration(seconds: 3),
  }) : super(
            content: Text(message),
            behavior: SnackBarBehavior.floating,
            width: 500.0);

  static void show(BuildContext context, String message, {Duration? duration}) {
    ScaffoldMessenger.of(context).showSnackBar(InfoSnackBar(
      message: message,
      duration: duration ?? const Duration(seconds: 3),
    ));
  }
}
