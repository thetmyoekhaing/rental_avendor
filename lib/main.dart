import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rental_vendor/brands/view/brands.dart';
import 'package:rental_vendor/business/view/businesses.dart';
import 'package:rental_vendor/categories/view/categories.dart';
import 'package:rental_vendor/home/view/profile.dart';
import 'package:rental_vendor/home/view/user_rent.dart';
import 'package:rental_vendor/products/view/products.dart';
import 'package:rental_vendor/providers/provider.dart';
import 'package:rental_vendor/screens/main_screen.dart';
import 'package:rental_vendor/screens/no_route_screen.dart';
import 'package:rental_vendor/screens/sign_in_screen.dart';
import 'package:rental_vendor/screens/sign_up_screen.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

void main() {
  getStates();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Vendor vendorState = Get.find(); // print("object");
    return FutureBuilder<String?>(
        future: vendorState.getToken(),
        builder: (context, snapshot) {
          // print(snapshot.connectionState == ConnectionState.done);
          final String? token = snapshot.data;
          // print("token --> $token");
          if (snapshot.connectionState == ConnectionState.done) {
            debugPrint("token -----> $token");
            // print(vendorProvider.authToken);
            return GetMaterialApp(
              onGenerateRoute: (settings) {
                switch (settings.name) {
                  case "/":
                    return MaterialPageRoute(
                      builder: (context) =>
                          token == null ? const SignUpScreen() : MainScreen(),
                    );

                  case "/login":
                    return MaterialPageRoute(
                      builder: (context) => const SignInScreen(),
                    );

                  case "/home":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(),
                    );

                  case "/brands":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(
                        body: const Brands(),
                      ),
                    );

                  case "/categories":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(
                        body: const Categories(),
                      ),
                    );

                  case "/products":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(
                        body: const Products(),
                      ),
                    );

                  case "/businesses":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(
                        body: const Businesses(),
                      ),
                    );

                  case "/user-rents":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(
                        body: const UserRent(),
                      ),
                    );

                  case "/profile":
                    return MaterialPageRoute(
                      builder: (context) => MainScreen(
                        body: const Profile(),
                      ),
                    );

                  default:
                    return MaterialPageRoute(
                      builder: (context) => const NoRouteScreen(),
                    );
                }
              },
              initialRoute: '/',
              title: 'Rental Vendor',
              theme: ThemeData(
                useMaterial3: true,
                // primarySwatch: primarySwatchColor,
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else {
            return const Center(
              child: Text("Fetching data ..."),
            );
          }
        });
  }
}

// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         providers
//       ], // assuming you have a List<ChangeNotifierProvider> called providers
//       child: Consumer<Vendor>(
//         builder: (context, vendorProvider, child) {
//           return FutureBuilder<String?>(
//             future: vendorProvider.getToken(),
//             builder: (context, snapshot) {
//               final String? token = snapshot.data;
//               return MaterialApp(
//                 onGenerateRoute: (settings) {
//                   switch (settings.name) {
//                     case "/":
//                       return MaterialPageRoute(
//                         builder: (context) =>
//                             token == null ? const SignUpScreen() : MainScreen(),
//                       );

//                     case "/login":
//                       return MaterialPageRoute(
//                         builder: (context) => const SignInScreen(),
//                       );

//                     case "/home":
//                       return MaterialPageRoute(
//                         builder: (context) => MainScreen(),
//                       );

//                     default:
//                       return MaterialPageRoute(
//                         builder: (context) => const NoRouteScreen(),
//                       );
//                   }
//                 },
//                 initialRoute: '/',
//                 title: 'Rental Vendor',
//                 theme: ThemeData(
//                   useMaterial3: true,
//                   // primarySwatch: primarySwatchColor,
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
