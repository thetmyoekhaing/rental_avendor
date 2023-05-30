import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class BrandsController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<Brand>> fetchBrands(BuildContext context) async {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    final brandListProvider = Provider.of<BrandList>(context, listen: false);
    // final vendor = await vendorProvider.getVendor();
    // print(vendor);
    final resData = await apiModel.fetchApi(
      route: "/brands",
      id: vendorProvider.id,
      whichId: "vendor_id",
      token: vendorProvider.authToken,
    );

    // print(resData['data']);

    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneBrand in data) {
        final Brand brand = Brand.fromJson(oneBrand);
        // print(brand.name);
        brandListProvider.addBrands(brand: brand);
      }
    } else {
      throw Exception("Error on brand controller ${resData['message']}");
    }
    return brandListProvider.getBrandsList();
  }
}
