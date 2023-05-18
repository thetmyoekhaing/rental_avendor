import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/auth/models/sign_in_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignInController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);
  SignInModel signInModel = SignInModel();

  Future<void> onPressed(BuildContext context) {
    final Completer<void> completer = Completer<void>();

    apiModel
        .postApi(route: "/login", jsonData: signInModel.toJson())
        .then((resData) async {
      if (resData["error"] == false) {
        SharedPreferences pref = await SharedPreferences.getInstance();
        final Vendor vendor = Vendor.fromJson(resData["data"]);
        await pref.setString("authToken", vendor.authToken!);
        // Navigator.of(context).pushReplacement(MaterialPageRoute(
        //   builder: (context) => const Home(),
        // ));
        pref.getString("authToken");
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(resData["message"])),
        );
      }
      completer.complete();
    });

    return completer.future;
  }

  void setController(
      {required value, required void Function(String) updateModel}) {
    updateModel(value);
  }
}
