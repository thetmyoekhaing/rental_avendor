import 'package:flutter/material.dart';
import 'package:rental_vendor/home/controllers/brands_controller.dart';

class Brands extends StatelessWidget {
  const Brands({super.key});

  @override
  Widget build(BuildContext context) {
    BrandsController brandsController = BrandsController();
    final brands = brandsController.fetchBrands(context);
    return Column(
      children: [
        const Text("Brands"),
        FutureBuilder<void>(
          future: brands,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
              // } else if (snapshot.hasError) {
              //   return
            } else {
              // Return a widget based on the data or lack thereof
              return Text('Data loaded successfully!');
            }
          },
        )
      ],
    );
  }
}
