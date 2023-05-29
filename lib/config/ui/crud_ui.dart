import 'package:flutter/material.dart';
import 'package:rental_vendor/constants/constants.dart';

class CrudUI extends StatelessWidget {
  bool isBusinesses;
  String name;
  VoidCallback? onPressed;
  Future<List<dynamic>>? futureFunc;
  VoidCallback? editOnPressed;
  VoidCallback? deleteOnPressed;
  CrudUI(
      {super.key,
      required this.name,
      required this.futureFunc,
      this.isBusinesses = false,
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
          const SizedBox(
            height: 30,
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
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: list.length,
                    itemBuilder: (context, index) {
                      final oneItem = list[index];
                      return Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: BoxDecoration(
                              color: prussianBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  oneItem.name ?? '',
                                  style: const TextStyle(
                                      color: white, fontSize: 20),
                                ),
                                isBusinesses
                                    ? Text(
                                        oneItem.address ?? '',
                                        style: const TextStyle(
                                            color: white, fontSize: 20),
                                      )
                                    : Container(),
                                Row(
                                  children: [
                                    GestureDetector(
                                      onTap: editOnPressed ?? () {},
                                      child: Container(
                                        padding: const EdgeInsets.all(7),
                                        decoration: BoxDecoration(
                                          color: pictionBlue,
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: const Text(
                                          "Edit",
                                          style: TextStyle(color: white),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: deleteOnPressed ?? () {},
                                      icon: const Icon(
                                        Icons.delete,
                                        size: 30,
                                        color: Colors.redAccent,
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 15,
                          )
                        ],
                      );
                    },
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
