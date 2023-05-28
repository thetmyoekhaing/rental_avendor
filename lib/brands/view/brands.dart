import 'package:flutter/material.dart';
import 'package:rental_vendor/brands/controller/brands_controller.dart';
import 'package:rental_vendor/config/ui/snack_bar.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    BrandsController brandsController = BrandsController();
    final brands = brandsController.fetchBrands(context);
    return Column(
      children: [
        const Text("Brands"),
        FutureBuilder(
          future: brands,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else if (snapshot.hasError) {
              return CustomSnackBar(message: snapshot.error.toString())
                  .showSnackBar(context);
            } else {
              return Text("success");
            }
          },
        )
      ],
    );
  }
}
