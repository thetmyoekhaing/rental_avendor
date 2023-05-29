import 'package:provider/provider.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/business/model/business_model.dart';
import 'package:rental_vendor/categories/model/category_model.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

final MultiProvider providers = MultiProvider(
  providers: [
    ChangeNotifierProvider<Vendor>(
      create: (context) => Vendor(),
    ),
    ChangeNotifierProvider<BrandList>(
      create: (context) => BrandList(),
    ),
    ChangeNotifierProvider<CategoryList>(
      create: (context) => CategoryList(),
    ),
    ChangeNotifierProvider<BusinessList>(
      create: (context) => BusinessList(),
    )
  ],
);
