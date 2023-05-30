import 'package:flutter/material.dart';
import 'package:rental_vendor/config/ui/crud_listview.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/products/view/product_grid.dart';

class CrudUI extends StatelessWidget {
  bool isProducts;
  String name;
  bool isBusinesses;
  Future<List<dynamic>>? futureFunc;
  VoidCallback? onPressed;
  VoidCallback? editOnPressed;
  VoidCallback? deleteOnPressed;
  CrudUI(
      {super.key,
      required this.name,
      required this.futureFunc,
      this.isBusinesses = false,
      this.isProducts = false,
      this.onPressed,
      this.deleteOnPressed,
      this.editOnPressed});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cereluan,
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(0),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
            color: prussianBlue,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(fontSize: 30, color: white),
                      ),
                      IconButton(
                        onPressed: onPressed ?? () {},
                        icon: const Icon(
                          Icons.add,
                          size: 30,
                          color: white,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const Divider(
            color: prussianBlue,
            thickness: 20,
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            decoration: const BoxDecoration(
              color: prussianBlue,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(color: white, fontSize: 20),
                ),
                isBusinesses
                    ? const Text(
                        "Address",
                        style: TextStyle(color: white, fontSize: 20),
                      )
                    : Container(),
                const SizedBox(
                  width: 60,
                )
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          FutureBuilder<List>(
            future: futureFunc,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                // print("${snapshot.error} -> error");
                return const Text("error fetching data");
              } else {
                final List list = snapshot.data!;
                return isProducts
                    ? ProductGrid(
                        productList: list,
                      )
                    : CRUDListView(
                        list: list,
                        isBusinesses: isBusinesses,
                        deleteOnPressed: deleteOnPressed,
                        editOnPressed: editOnPressed,
                        onPressed: onPressed);
              }
            },
          )
        ],
      ),
    );
  }
}
