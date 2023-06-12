import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/business/model/business_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class BusinessController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<Business>> fetchBrands(BuildContext context) async {
    final Vendor vendorState = Get.find(); // print("object");
    final BusinessList businessListState = Get.find();
    final resData = await apiModel.fetchApi(
      route: "/business",
      id: vendorState.id,
      whichId: "vendor_id",
      token: vendorState.authToken,
    );

    // print(resData['data']);

    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneItem in data) {
        final Business business = Business.fromJson(oneItem);
        // print(brand.name);
        businessListState.addBusinesses(business: business);
      }
    } else {
      throw Exception("Error on brand controller ${resData['message']}");
    }
    return businessListState.getBusinessList();
  }
}
