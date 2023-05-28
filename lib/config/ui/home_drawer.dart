import 'package:flutter/material.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/home/controllers/drawer_menu_list.dart';
import 'package:rental_vendor/screens/main_screen.dart';

class HomeDrawer extends StatelessWidget {
  const HomeDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Container(
        width: 300,
        color: cereluan,
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            const Text("Rental Service"),
            Expanded(
              child: ListView(
                children: DrawerMenuList.menuList.map((menu) {
                  return ListTile(
                    onTap: () {
                      Navigator.pop(context);
                      switch (menu.menuName) {
                        case "Home":
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      MainScreen(),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                          break;

                        default:
                          Navigator.of(context).pushReplacement(
                            PageRouteBuilder(
                              pageBuilder:
                                  (context, animation, secondaryAnimation) =>
                                      MainScreen(
                                body: menu.menuPage,
                              ),
                              transitionDuration:
                                  const Duration(milliseconds: 500),
                              transitionsBuilder: (context, animation,
                                  secondaryAnimation, child) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: child,
                                );
                              },
                            ),
                          );
                          break;
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) {
                        //     return HomeScreen(body: menu.menuPage);
                        //   },
                        // ));
                      }
                    },
                    leading: Icon(
                      menu.icon,
                      color: white,
                    ),
                    title: Text(
                      menu.menuName,
                      style: const TextStyle(
                          color: white, fontWeight: FontWeight.normal),
                    ),
                  );
                }).toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
