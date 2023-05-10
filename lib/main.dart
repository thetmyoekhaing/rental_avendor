import 'package:flutter/material.dart';
import 'package:rental_vendor/screens/home_screen.dart';
import 'package:rental_vendor/screens/no_route_screen.dart';
import 'package:rental_vendor/screens/sign_in_screen.dart';
import 'package:rental_vendor/screens/sign_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case "/":
            return MaterialPageRoute(
              builder: (context) => const SignUpScreen(),
            );

          case "/login":
            return MaterialPageRoute(
              builder: (context) => const SignInScreen(),
            );
          default:
            return MaterialPageRoute(
              builder: (context) => const NoRouteScreen(),
            );
        }
      },
      title: 'Rental Vendor',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
    );
  }
}
