import 'package:flutter/material.dart';

class CustomSnackBar {
  final String? message;

  CustomSnackBar({this.message});

  void showSnackBar(BuildContext context) {
    if (message != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message!)),
      );
    }
  }
}
