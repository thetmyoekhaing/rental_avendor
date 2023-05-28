import 'package:flutter/material.dart';
import 'package:rental_vendor/auth/controllers/sign_in_controller.dart';
import 'package:rental_vendor/auth/controllers/sign_up_controller.dart';
import 'package:rental_vendor/auth/controllers/text_form_list.dart';
import 'package:rental_vendor/auth/models/sign_in_model.dart';
import 'package:rental_vendor/auth/models/sign_up_model.dart';
import 'package:rental_vendor/constants/constants.dart';

class Auth extends StatelessWidget {
  final BuildContext? signInContext;
  final bool isSignUp;
  final String? title;
  final String? btnText;
  final bool isLogin;
  const Auth(
      {Key? key,
      this.signInContext,
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
      body: SingleChildScrollView(
        child: Container(
          color: white,
          child: Padding(
            padding: EdgeInsets.only(top: isSignUp ? 30 : 200),
            child: Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    width: 400,
                    height: isLogin ? 400 : 750,
                    margin: const EdgeInsets.only(top: 25),
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.zero),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 4,
                            offset: Offset(-1, -1),
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
                            style: ElevatedButton.styleFrom(
                              backgroundColor: prussianBlue,
                              elevation: 3,
                            ),
                            onPressed: () {
                              isLogin
                                  ? signInController.onPressed(signInContext!)
                                  : () {};
                              isSignUp
                                  ? signUpController.onPressed(context)
                                  : () {};
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                btnText ?? "Register",
                                style: const TextStyle(color: white),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
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
                      decoration: BoxDecoration(
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.grey,
                            spreadRadius: 2,
                            blurRadius: 2,
                            offset: Offset(4, 4),
                          ),
                        ],
                        color: prussianBlue,
                        borderRadius: BorderRadius.circular(20),
                      ),
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
        ),
      ),
    );
  }
}
