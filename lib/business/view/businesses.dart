import 'package:flutter/material.dart';
import 'package:rental_vendor/business/controller/business_controller.dart';
import 'package:rental_vendor/config/ui/crud_ui.dart';

class Businesses extends StatelessWidget {
  const Businesses({super.key});

  @override
  Widget build(BuildContext context) {
    BusinessController businessController = BusinessController();

    final fetchedBusinesses = businessController.fetchBrands(context);
    return Scaffold(
      body: CrudUI(
        isBusinesses: true,
        name: "Businesses",
        futureFunc: fetchedBusinesses,
      ),
    );
  }
}
