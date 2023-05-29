import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/brands/controller/brands_controller.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';
import 'package:rental_vendor/constants/constants.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    BrandsController brandsController = BrandsController();
    final brandListProvider = Provider.of<BrandList>(context, listen: false);

    final fetchedBrands = brandsController.fetchBrands(context);
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
                      const Text(
                        "Brands",
                        style: TextStyle(fontSize: 30, color: white),
                      ),
                      IconButton(
                        onPressed: () {},
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
            height: 20,
          ),
          // Container(
          //   padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
          //   width: double.infinity,
          //   decoration: const BoxDecoration(
          //     color: prussianBlue,
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(30),
          //     ),
          //   ),
          //   child: const Column(
          //     children: [
          //       SizedBox(
          //         width: double.infinity,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //           children: [
          //             Text("Name"),
          //             Row(
          //               children: [
          //                 Card(
          //                   child: Text("Edit"),
          //                 ),
          //                 SizedBox(
          //                   width: 20,
          //                 ),
          //                 Card(
          //                   child: Icon(Icons.delete),
          //                 )
          //               ],
          //             ),
          //           ],
          //         ),
          //       )
          //     ],
          //   ),
          // ),
          FutureBuilder<List<Brand>>(
            future: fetchedBrands,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CircularProgressIndicator();
              } else if (snapshot.hasError) {
                print("${snapshot.error} -> error");
                return Text("error fetching data");
              } else {
                final List<Brand> brandsList = snapshot.data!;
                return Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: brandsList.length,
                    itemBuilder: (context, index) {
                      final Brand brand = brandsList[index];
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
                                  brand.name ?? '',
                                  style: const TextStyle(
                                      color: white, fontSize: 20),
                                ),
                                Row(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.all(7),
                                      decoration: BoxDecoration(
                                        color: pictionBlue,
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: const Text(
                                        "Edit",
                                        style: TextStyle(color: white),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    IconButton(
                                      onPressed: () {},
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

//  Expanded(
//                   child: ListView.builder(
//                     shrinkWrap: true,
//                     itemCount: brandsList.length,
//                     itemBuilder: (context, index) {
//                       final Brand brand = brandsList[index];
//                       return 
//                     },
//                   ),
//                 );