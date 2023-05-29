import 'package:flutter/material.dart';
import 'package:rental_vendor/categories/controller/category_controller.dart';
import 'package:rental_vendor/config/ui/crud_ui.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    CategoryController categoryController = CategoryController();

    final fetchedCats = categoryController.fetchCategories(context);
    return Scaffold(
      body: CrudUI(
        name: "Categories",
        futureFunc: fetchedCats,
      ),
    );
  }
}
