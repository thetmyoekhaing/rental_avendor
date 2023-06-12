import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/categories/model/category_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class CategoryController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<CategoryModel>> fetchCategories(BuildContext context) async {
    final Vendor vendorState = Get.find(); // print("object");
    final CategoryList catListState = Get.find();
    final resData = await apiModel.fetchApi(
      route: "/categories",
      id: vendorState.id,
      whichId: "vendor_id",
      token: vendorState.authToken,
    );
    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneItem in data) {
        final CategoryModel cat = CategoryModel.fromJson(oneItem);
        // print(brand.name);
        catListState.addCats(cat: cat);
      }
    } else {
      throw Exception("Error on brand controller ${resData['message']}");
    }
    return catListState.getCatList();
  }
}
