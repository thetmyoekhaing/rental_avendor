import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/auth/models/sign_in_model.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/screens/main_screen.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class SignInController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);
  SignInModel signInModel = SignInModel();

  Future<void> onPressed(BuildContext context) {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    final Completer<void> completer = Completer<void>();

    apiModel
        .postApi(route: "/login", jsonData: signInModel.toJson())
        .then((resData) async {
      if (resData["error"] == false) {
        final Vendor vendor = Vendor.fromJson(resData["data"]);
        vendorProvider.addVendorData(vendor: vendor);
        vendorProvider.setToken();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MainScreen(),
          ),
        );
      } else {
        CustomSnackBar(message: resData["message"]).showSnackBar(context);
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
