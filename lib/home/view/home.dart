import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/home/controllers/drawer_menu_list.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final DateTime tdyDate = DateTime.now();
    final greeding = tdyDate.hour;
    final tdy = DateFormat("yyyy-MMM-dd").format(tdyDate);
    final Vendor vendorState = Get.find();
    return Scaffold(
      backgroundColor: prussianBlue,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            margin: const EdgeInsets.all(0),
            color: cereluan,
            child: ListTile(
              textColor: white,
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    tdy,
                    style: TextStyle(color: white.withOpacity(0.8)),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      Text(greeding >= 12 && greeding <= 16
                          ? "Good Afternoon"
                          : greeding >= 6 && greeding <= 12
                              ? "Good Morning"
                              : greeding >= 17 && greeding <= 19
                                  ? "Good Evening"
                                  : "Good Night"),
                      const SizedBox(
                        width: 20,
                      ),
                      Icon(
                        greeding >= 12 && greeding <= 16
                            ? Icons.wb_sunny
                            : greeding >= 6 && greeding <= 12
                                ? Icons.brightness_4_rounded
                                : greeding >= 17 && greeding <= 19
                                    ? Icons.brightness_2
                                    : Icons.bed,
                        color: greeding >= 12 && greeding <= 16
                            ? Colors.yellow.shade700
                            : greeding >= 6 && greeding <= 12
                                ? Colors.yellow.shade700
                                : greeding >= 17 && greeding <= 19
                                    ? white
                                    : white,
                      )
                    ],
                  )
                ],
              ),
              title: Text(
                "Welcome to the Rental Dashboard , ${vendorState.name}",
                style: const TextStyle(fontWeight: FontWeight.w600),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Manage",
              style: TextStyle(
                  color: white, fontSize: 25, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          // grid card
          Expanded(
            child: GridView.count(
              childAspectRatio: 1.3,
              shrinkWrap: true,
              crossAxisCount: 2,
              mainAxisSpacing: 10,
              crossAxisSpacing: 10,
              children: DrawerMenuList.menuList.map((menu) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      switch (menu.menuName) {
                        case "Home":
                          CustomSnackBar(message: "You're alredy in Home Page")
                              .showSnackBar(context);
                          break;

                        case 'Log Out':
                          vendorState.removeToken();
                          Get.toNamed('/');
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return const MyApp();
                          //     },
                          //   ),
                          // );
                          break;

                        default:
                          Get.toNamed(menu.route!);
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(
                          //     builder: (context) {
                          //       return MainScreen(
                          //         body: menu.menuPage,
                          //       );
                          //     },
                          //   ),
                          // );
                          break;
                      }
                    },
                    child: Card(
                      margin: const EdgeInsets.all(0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: const LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [pictionBlue, cereluan],
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                        color: richBlack.withOpacity(0.5),
                                        blurRadius: 1,
                                        spreadRadius: 3,
                                        offset: const Offset(2, 2))
                                  ],
                                  color: white,
                                  borderRadius: BorderRadius.circular(30),
                                ),
                                child: Icon(menu.icon),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    menu.menuName,
                                    style: const TextStyle(
                                        color: white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(
                                    Icons.touch_app,
                                    color: white,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
