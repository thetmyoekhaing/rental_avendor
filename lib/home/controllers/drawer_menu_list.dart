import 'package:flutter/material.dart';
import 'package:rental_vendor/home/models/drawer_model.dart';
import 'package:rental_vendor/home/view/brands.dart';
import 'package:rental_vendor/home/view/categories.dart';
import 'package:rental_vendor/home/view/products.dart';
import 'package:rental_vendor/screens/home_screen.dart';

class DrawerMenuList {
  static List<DrawerModel> menuList = [
    DrawerModel(icon: Icons.home, menuName: "Home", menuPage: HomeScreen()),
    DrawerModel(
        icon: Icons.shopping_bag, menuName: "Brands", menuPage: const Brands()),
    DrawerModel(
        icon: Icons.format_list_numbered,
        menuName: "Categories",
        menuPage: const Categories()),
    DrawerModel(
        icon: Icons.sell, menuName: "Products", menuPage: const Products())
  ];
}
