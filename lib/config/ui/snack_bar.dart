import 'package:flutter/material.dart';

class CustomSnackBar {
  final String message;
  CustomSnackBar({required this.message});

  Widget showSnackBar(BuildContext context) {
    return SnackBar(content: Text(message));
  }
}
