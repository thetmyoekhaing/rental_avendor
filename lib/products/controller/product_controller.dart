import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/products/model/product_model.dart';
import 'package:rental_vendor/products/model/product_provider.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class ProductController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<Product>> fetchProducts(BuildContext context) async {
    final Vendor vendorState = Get.find(); // print("object");

    final ProductList productListState = Get.find();
    final resData = await apiModel.fetchApi(
      route: "/products",
      id: vendorState.id,
      whichId: "vendor_id",
      token: vendorState.authToken,
    );

    // print("${resData['data'][0]['description']} ^^^^^^^^^^^^^^^^^^^^^");

    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneItem in data) {
        final Product product = Product.fromJson(oneItem);

        // print(product.mainThambNail!.mediaLink.runtimeType);
        productListState.addProducts(product: product);
      }
    } else {
      throw Exception("Error on product controller ${resData['message']}");
    }
    return productListState.getProducts();
  }
}
