import 'package:flutter/material.dart';
import 'package:rental_vendor/auth/views/auth.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Auth(
      isSignUp: true,
    );
  }
}
