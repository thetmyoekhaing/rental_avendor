import 'package:flutter/material.dart';

class CustomSnackBar {
  final String message;
  CustomSnackBar({required this.message});

  void showSnackBar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }
}
