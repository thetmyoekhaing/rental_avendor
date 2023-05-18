import 'package:flutter/material.dart';
import 'package:rental_vendor/config/ui/home_drawer.dart';
import 'package:rental_vendor/home/view/home.dart';

class HomeScreen extends StatelessWidget {
  Widget? body;
  HomeScreen({super.key, this.body});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Rental Service"),),
      drawer: const HomeDrawer(),
      body: body ?? const Home(),
    );
  }
}
