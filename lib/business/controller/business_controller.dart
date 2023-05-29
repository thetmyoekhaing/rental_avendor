import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/business/model/business_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class BusinessController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<Business>> fetchBrands(BuildContext context) async {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    final businessListProvider =
        Provider.of<BusinessList>(context, listen: false);
    final resData = await apiModel.fetchApi(
      route: "/business",
      id: vendorProvider.id,
      whichId: "vendor_id",
      token: vendorProvider.authToken,
    );

    // print(resData['data']);

    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneItem in data) {
        final Business business = Business.fromJson(oneItem);
        // print(brand.name);
        businessListProvider.addBusinesses(business: business);
      }
    } else {
      throw Exception("Error on brand controller ${resData['message']}");
    }
    return businessListProvider.getBusinessList();
  }
}
