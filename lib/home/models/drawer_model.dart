import 'package:flutter/material.dart';

class DrawerModel {
  final IconData icon;
  final String menuName;
  final Widget menuPage;
  DrawerModel(
      {required this.icon, required this.menuName, required this.menuPage});
}
