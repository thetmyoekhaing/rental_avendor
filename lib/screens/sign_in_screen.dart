import 'package:flutter/material.dart';
import 'package:rental_vendor/auth/views/auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Auth(
      signInContext: context,
      title: "Login Form",
      btnText: "Login",
      isLogin: true,
    );
  }
}
