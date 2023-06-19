import 'package:flutter/material.dart';
import 'package:rental_vendor/config/ui/table_row.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/products/model/product_model.dart';

class ProductDetail extends StatelessWidget {
  Product product;
  ProductDetail({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    debugPrint("product --> ${product.category![0].name}");
    return SafeArea(
      child: Scaffold(
        backgroundColor: white,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Row(
                        children: [
                          const Icon(
                            Icons.arrow_back,
                            color: richBlack,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Back".toUpperCase(),
                            style: const TextStyle(color: richBlack),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Center(
                      child: Image.network(
                        product.mainThambNail!.mediaLink!,
                        width: 300,
                        height: 300,
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      product.name!.toUpperCase(),
                      style: const TextStyle(fontSize: 30, color: prussianBlue),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      product.description!,
                      style: TextStyle(
                        fontSize: 15,
                        color: richBlack.withOpacity(0.7),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Available Colors",
                      style: TextStyle(fontSize: 20, color: prussianBlue),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: product.color!
                          .map((c) => Container(
                                margin: const EdgeInsets.only(right: 10),
                                child: Icon(
                                  Icons.circle,
                                  color: ColorExtension.fromString(c),
                                ),
                              ))
                          .toList(),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "${product.price.toString()} MMK",
                      style: const TextStyle(fontSize: 20, color: prussianBlue),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Product Information",
                      style: TextStyle(fontSize: 20, color: prussianBlue),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),

              SingleChildScrollView(
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.zero),
                      color: pictionBlue),
                  child: Column(
                    children: [
                      MyTableRow(rowData: product.name!, rowTitle: "Name"),
                      MyTableRow(
                          rowData: product.energyComsumption!,
                          rowTitle: "Energy Consumption"),
                      MyTableRow(
                          rowData: product.color.toString(), rowTitle: "Color"),
                      MyTableRow(
                          rowData: product.size.toString(), rowTitle: "Size"),
                      MyTableRow(
                          rowData: product.extraDevice.toString(),
                          rowTitle: "Extra Device"),
                      MyTableRow(
                          rowData: product.description!,
                          rowTitle: "Description"),
                      MyTableRow(
                          rowData: "${product.price.toString()} MMK",
                          rowTitle: "Price"),
                      MyTableRow(
                          rowData: product.productCode!,
                          rowTitle: "Product Code"),
                      MyTableRow(
                          rowData: product.brand!.name!, rowTitle: "Brand"),
                      MyTableRow(
                          rowData: product.category!
                              .map((cat) => cat.name!)
                              .toString(),
                          rowTitle: "Category"),
                      MyTableRow(
                          rowData: "${product.durationDate} Days",
                          rowTitle: "Duration Date"),
                      MyTableRow(
                          rowData: "${product.insurenceData} Days",
                          rowTitle: "Insurence Date"),
                      MyTableRow(
                          rowData: product.business!
                              .map((b) => b.name.toString())
                              .toString(),
                          rowTitle: "Business"),
                    ],
                  ),
                ),
              ),

              // DataTable(
              //   columns: const [
              //     DataColumn(
              //       label: SizedBox(
              //         height: 0,
              //         width: 0,
              //       ),
              //     ),
              //     DataColumn(
              //       label: SizedBox(
              //         height: 0,
              //         width: 0,
              //       ),
              //     ),
              //   ],
              //   rows: [
              //     DataRow(
              //       cells: [
              //         DataCell(
              //           Expanded(
              //             child: Container(
              //               color: richBlack.withOpacity(0.5),
              //               child: const Text(
              //                 'Name',
              //                 style: TextStyle(color: white),
              //               ),
              //             ),
              //           ),
              //         ),
              //         DataCell(
              //           Text(product.name!),
              //         ),
              //       ],
              //     )
              //   ],
              // ),
              const SizedBox(
                height: 50,
              )
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   child: Row(
              //     children: product.multiImages!.map((image) {
              //       return Image.network(image.mediaLink!);
              //     }).toList(),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}

extension ColorExtension on Color {
  static Color fromString(String colorString) {
    if (colorString.startsWith('#')) {
      return Color(
          int.parse(colorString.substring(1, 7), radix: 16) + 0xFF000000);
    }
    return Colors.black; // Default color if invalid or not found
  }
}
