import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/products/model/product_model.dart';
import 'package:rental_vendor/products/model/product_provider.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class ProductController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<Product>> fetchProducts(BuildContext context) async {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    final businessListProvider =
        Provider.of<ProductList>(context, listen: false);
    final resData = await apiModel.fetchApi(
      route: "/products",
      id: vendorProvider.id,
      whichId: "vendor_id",
      token: vendorProvider.authToken,
    );

    // print("${resData['data'][0]['description']} ^^^^^^^^^^^^^^^^^^^^^");

    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneItem in data) {
        final Product product = Product.fromJson(oneItem);

        // print(product.mainThambNail!.mediaLink.runtimeType);
        businessListProvider.addProducts(product: product);
      }
    } else {
      throw Exception("Error on product controller ${resData['message']}");
    }
    return businessListProvider.getBusinessList();
  }
}
