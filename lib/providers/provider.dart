import 'package:get/get.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/business/model/business_model.dart';
import 'package:rental_vendor/categories/model/category_model.dart';
import 'package:rental_vendor/products/model/product_provider.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

void getStates() {
  Get.put(Vendor());
  Get.put(BrandList());
  Get.put(CategoryList());
  Get.put(BusinessList());
  Get.put(ProductList());
}
