import 'package:flutter/material.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/products/view/product_detail.dart';

class ProductGrid extends StatelessWidget {
  final List productList;

  const ProductGrid({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    // print(productList[0]);
    // return Text("data");

    return Expanded(
      child: GridView.count(
        childAspectRatio: 0.65,
        shrinkWrap: true,
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children: productList.map(
          (product) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return ProductDetail(product: product);
                    },
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          color: richBlack.withOpacity(0.7),
                          offset: const Offset(4, 5),
                          blurRadius: 2,
                          spreadRadius: 2),
                    ],
                    borderRadius: BorderRadius.circular(20),
                    color: white,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            product.mainThambNail.mediaLink,
                            width: double.infinity,
                            height: 150,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          child: Column(
                            children: [
                              Text(
                                product.name,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: richBlack),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                product.description,
                                style: TextStyle(
                                  color: richBlack.withOpacity(0.5),
                                ),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "${product.price.toString()} MMK",
                                style: const TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.w600,
                                    color: richBlack),
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        height: 45.6,
                        width: double.infinity,
                        decoration: const BoxDecoration(
                            color: prussianBlue,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(20),
                                bottomRight: Radius.circular(20))),
                        child: const Center(
                          child: Text(
                            "See Details",
                            style: TextStyle(
                                color: white,
                                fontSize: 17,
                                // fontWeight: FontWeight.w500,
                                wordSpacing: 1),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          },
        ).toList(),
      ),
    );
  }
}
