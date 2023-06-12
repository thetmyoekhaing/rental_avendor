import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_vendor/products/model/product_model.dart';

class ProductList extends GetxController {
  List<Product> productList = [];
  void addProducts({required Product product}) {
    bool isProductExist = productList
        .any((existingProduct) => existingProduct.id == product.id);
    if (!isProductExist) {
      productList.add(product);
    }
    // print(productList[0].mainThambNail!.mediaLink.runtimeType);
  }

  List<Product> getProducts() {
    return productList;
  }
}
