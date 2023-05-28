import 'package:flutter/material.dart';
import 'package:rental_vendor/config/ui/home_drawer.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/home/view/home.dart';

// ignore: must_be_immutable
class MainScreen extends StatelessWidget {
  Widget? body;
  MainScreen({super.key, this.body});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: white,
        backgroundColor: cereluan,
        title: const Text("Rental Service"),
      ),
      drawer: const HomeDrawer(),
      body: body ?? const Home(),
    );
  }
}
