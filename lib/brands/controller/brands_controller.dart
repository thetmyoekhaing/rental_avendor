import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class BrandsController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<void> fetchBrands(BuildContext context) async {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);

    final resData = await apiModel.fetchApi(
      route: "/brands",
      id: vendorProvider.id,
      whichId: "vendor_id",
      token: vendorProvider.authToken,
    );

    if (resData['error'] == false) {
      print(resData['data']);
    } else {
      CustomSnackBar snackBar = CustomSnackBar(message: resData['message']);
      snackBar.showSnackBar(context);
    }
  }
}
