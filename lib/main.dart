import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/providers/provider.dart';
import 'package:rental_vendor/screens/main_screen.dart';
import 'package:rental_vendor/screens/no_route_screen.dart';
import 'package:rental_vendor/screens/sign_in_screen.dart';
import 'package:rental_vendor/screens/sign_up_screen.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

void main() {
  runApp(MultiProvider(
    providers: [providers],
    child: const MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    return FutureBuilder<String?>(
        future: vendorProvider.getToken(),
        builder: (context, snapshot) {
          final String? token = snapshot.data;
          return MaterialApp(
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
