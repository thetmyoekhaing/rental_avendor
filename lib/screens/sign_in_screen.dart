import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:rental_vendor/auth/views/auth.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Auth(
      title: "Login Form",
      btnText: "Login",
      isLogin: true,
    );
  }
}
