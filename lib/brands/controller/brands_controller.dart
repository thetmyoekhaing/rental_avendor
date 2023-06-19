import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class BrandsController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<Brand>> fetchBrands(BuildContext context) async {
    final Vendor vendorState = Get.find(); // print("object");
    final BrandList brandListState =
        Get.find(); // final vendor = await vendorProvider.getVendor();
    // print(vendor);
    final resData = await apiModel.fetchApi(
      route: "/brands",
      id: vendorState.id,
      whichId: "vendor_id",
      token: vendorState.authToken,
    );

    // print(resData['data']);

    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneBrand in data) {
        final Brand brand = Brand.fromJson(oneBrand);
        // print(brand.name);
        brandListState.addBrands(brand: brand);
      }
    } else {
      throw Exception("Error on brand controller ${resData['message']}");
    }
    return brandListState.getBrandsList();
  }
}
