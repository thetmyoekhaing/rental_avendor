import 'package:flutter/material.dart';
import 'package:rental_vendor/auth/controllers/sign_in_controller.dart';
import 'package:rental_vendor/auth/controllers/sign_up_controller.dart';
import 'package:rental_vendor/auth/controllers/text_form_list.dart';
import 'package:rental_vendor/auth/models/sign_in_model.dart';
import 'package:rental_vendor/auth/models/sign_up_model.dart';

class Auth extends StatelessWidget {
  final bool isSignUp;
  final String? title;
  final String? btnText;
  final bool isLogin;
  const Auth(
      {Key? key,
      this.title,
      this.btnText,
      this.isLogin = false,
      this.isSignUp = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    SignInModel signInModel = SignInModel();
    SignInController signInController = SignInController();
    SignUpModel signUpModel = SignUpModel();
    SignUpController signUpController = SignUpController();
    return Scaffold(
      body: Container(
        color: const Color(0xffE8EFFF),
        child: Center(
          child: Stack(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 350,
                height: isLogin ? 400 : 700,
                margin: const EdgeInsets.only(top: 25),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.zero),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 2,
                        blurRadius: 2,
                        offset: Offset(4, 4),
                      )
                    ]),
                child: Form(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Visibility(
                        visible: isLogin,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ...TextFormList()
                                .signInFormList(
                                    signIncontroller: signInController,
                                    signInModel: signInModel)
                                .map((taskform) => taskform)
                          ],
                        ),
                      ),
                      Visibility(
                        visible: isSignUp,
                        child: ListView(
                          shrinkWrap: true,
                          children: [
                            ...TextFormList()
                                .signUpFormList(
                                    signUpController: signUpController,
                                    signUpModel: signUpModel)
                                .map((taskform) => taskform)
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          isLogin ? signInController.onPressed(context) : () {};
                          isSignUp
                              ? signUpController.onPressed(context)
                              : () {};
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(btnText ?? "Register"),
                        ),
                      ),

                      TextButton(
                          onPressed: () {
                            isLogin
                                ? Navigator.of(context)
                                    .pushReplacementNamed("/")
                                : Navigator.of(context)
                                    .popAndPushNamed("/login");
                          },
                          child: isLogin
                              ? const Text(
                                  "Don't have an account? Go to Register")
                              : const Text(
                                  "Already have an account? Go to Login")),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 50,
                right: 50,
                top: 0,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          blurRadius: 2,
                          offset: Offset(4, 4),
                        ),
                      ],
                      color: Colors.blueAccent,
                      borderRadius: BorderRadius.all(Radius.zero)),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(10),
                      child: Text(
                        title ?? "Register Form",
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 35,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
