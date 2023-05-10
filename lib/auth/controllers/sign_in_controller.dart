import 'package:flutter/material.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/api/base_url.dart';
import 'package:rental_vendor/auth/models/sign_in_model.dart';

class SignInController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);
  SignInModel signInModel = SignInModel();

  void onPressed(BuildContext context) async {
    final resData =
        await apiModel.postApi(route: "/login", jsonData: signInModel.toJson());
    print(resData["data"]);
  }

  void setController(
      {required value, required void Function(String) updateModel}) {
    updateModel(value);
  }
}
