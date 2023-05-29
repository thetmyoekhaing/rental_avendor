import 'package:flutter/material.dart';
import 'package:rental_vendor/business/view/businesses.dart';
import 'package:rental_vendor/home/models/drawer_model.dart';
import 'package:rental_vendor/brands/view/brands.dart';
import 'package:rental_vendor/categories/view/categories.dart';
import 'package:rental_vendor/home/view/products.dart';
import 'package:rental_vendor/home/view/profile.dart';
import 'package:rental_vendor/home/view/user_rent.dart';
import 'package:rental_vendor/screens/main_screen.dart';

class DrawerMenuList {
  static List<DrawerModel> menuList = [
    DrawerModel(icon: Icons.home, menuName: "Home", menuPage: MainScreen()),
    DrawerModel(
        icon: Icons.shopping_bag, menuName: "Brands", menuPage: const Brands()),
    DrawerModel(
        icon: Icons.format_list_numbered,
        menuName: "Categories",
        menuPage: const Categories()),
    DrawerModel(
      icon: Icons.sell,
      menuName: "Products",
      menuPage: const Products(),
    ),
    DrawerModel(
      icon: Icons.business_center,
      menuName: "Business",
      menuPage: const Businesses(),
    ),
    DrawerModel(
      icon: Icons.supervised_user_circle,
      menuName: "User Rents",
      menuPage: const UserRent(),
    ),
    DrawerModel(
      icon: Icons.person,
      menuName: "Profile",
      menuPage: const Profile(),
    ),
    DrawerModel(icon: Icons.logout, menuName: "Log Out")
  ];
}
