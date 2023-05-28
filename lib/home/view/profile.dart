import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rental_vendor/constants/constants.dart';
import 'package:rental_vendor/vendors/models/vendor_model.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final vendorProvider = Provider.of<Vendor>(context, listen: false);
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: pictionBlue),
                child: Center(
                  child: Text(
                    vendorProvider.name![0].toUpperCase(),
                    style: const TextStyle(
                        color: white,
                        fontSize: 40,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                vendorProvider.name!,
                style: const TextStyle(
                    color: pictionBlue,
                    fontWeight: FontWeight.w600,
                    fontSize: 30),
              ),
              const SizedBox(
                height: 10,
              ),
              Text("Shop Name : ${vendorProvider.shopName}"),
              Text("Email ${vendorProvider.email}"),
              Text("Phone ${vendorProvider.phone}"),
              Text("Join Date ${vendorProvider.joinDate}"),
              Text("Address ${vendorProvider.address}")
            ],
          ),
        ),
      ),
    );
  }
}
