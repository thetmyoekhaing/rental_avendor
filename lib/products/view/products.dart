import 'package:flutter/material.dart';
import 'package:rental_vendor/config/ui/crud_ui.dart';
import 'package:rental_vendor/products/controller/product_controller.dart';

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    ProductController productController = ProductController();

    final fetchedProducts = productController.fetchProducts(context);
    return Scaffold(
      body: CrudUI(
        name: "Products",
        isProducts: true,
        futureFunc: fetchedProducts,
      ),
    );
  }
}
