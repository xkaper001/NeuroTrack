//create custom snackbar
import 'package:flutter/material.dart';

class CustomSnackbar {
  final String message;
  final Color backgroundColor;
  final Color textColor;

  CustomSnackbar({
    required this.message,
    this.backgroundColor = Colors.black,
    this.textColor = Colors.white,
  });
  //use scafold messenger
  void show(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        action: SnackBarAction(
          label: 'Close',
          textColor: textColor,
          onPressed: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          },
        ),
      ),
    );
  }
}
