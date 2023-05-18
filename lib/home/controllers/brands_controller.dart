import 'package:flutter/material.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';

class BrandsController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);
  Future<void> fetchBrands(BuildContext context) async {
    apiModel.fetchApi(route: "/brands").then((resData) async {
      if (resData['error'] == false) {
        return resData['data'];
      } else {
        CustomSnackBar snackBar = CustomSnackBar(message: resData['message']);
        return snackBar.showSnackBar(context);
      }
    });
  }
}
