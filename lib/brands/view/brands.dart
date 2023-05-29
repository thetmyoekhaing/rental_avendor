import 'package:flutter/material.dart';
import 'package:rental_vendor/brands/controller/brands_controller.dart';
import 'package:rental_vendor/config/ui/crud_ui.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    BrandsController brandsController = BrandsController();

    final fetchedBrands = brandsController.fetchBrands(context);
    return Scaffold(
      body: CrudUI(
        name: "Brands",
        futureFunc: fetchedBrands,
      ),
    );
  }
}
