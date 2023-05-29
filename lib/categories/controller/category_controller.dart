import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/api/api_model.dart';
import 'package:rental_vendor/categories/model/category_model.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class CategoryController {
  ApiModel apiModel = ApiModel(baseUrl: baseUrl);

  Future<List<CategoryModel>> fetchCategories(BuildContext context) async {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    final cateListProvider = Provider.of<CategoryList>(context, listen: false);
    final resData = await apiModel.fetchApi(
      route: "/categories",
      id: vendorProvider.id,
      whichId: "vendor_id",
      token: vendorProvider.authToken,
    );
    if (resData['error'] == false) {
      final List<dynamic> data = resData['data'];
      for (var oneItem in data) {
        final CategoryModel cat = CategoryModel.fromJson(oneItem);
        // print(brand.name);
        cateListProvider.addCats(cat: cat);
      }
    } else {
      throw Exception("Error on brand controller ${resData['message']}");
    }
    return cateListProvider.getCatList();
  }
}
