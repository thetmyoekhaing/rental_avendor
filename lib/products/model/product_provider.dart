import 'package:flutter/material.dart';
import 'package:rental_vendor/products/model/product_model.dart';

class ProductList with ChangeNotifier {
  List<Product> productList = [];
  void addProducts({required Product product}) {
    bool isProductExist = productList
        .any((exitstingProduct) => exitstingProduct.id == product.id);
    if (!isProductExist) {
      productList.add(product);
    }
    // print(productList[0].mainThambNail!.mediaLink.runtimeType);
    notifyListeners();
  }

  List<Product> getBusinessList() {
    return productList;
  }
}
