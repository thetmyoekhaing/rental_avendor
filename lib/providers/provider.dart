import 'package:provider/provider.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

final MultiProvider providers = MultiProvider(
  providers: [
    ChangeNotifierProvider<Vendor>(
      create: (context) => Vendor(),
    ),
    ChangeNotifierProvider<Brand>(
      create: (context) => Brand(),
    )
  ],
);
