import 'package:flutter/material.dart';

class DrawerModel {
  final String? route;
  final IconData icon;
  final String menuName;
  final Widget? menuPage;
  DrawerModel(
      {this.route, required this.icon, required this.menuName, this.menuPage});
}
