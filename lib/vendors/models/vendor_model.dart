import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
part 'vendor_model.g.dart';

@JsonSerializable()
class Vendor with ChangeNotifier {
  String? name;

  @JsonKey(name: "shop_name")
  String? shopName;
  String? email;
  String? phone;

  @JsonKey(name: "join_date")
  String? joinDate;
  String? address;
  int? status;

  @JsonKey(name: "auth_token")
  String? authToken;

  @JsonKey(name: "_id")
  String? id;
  Vendor(
      {this.name,
      this.shopName,
      this.email,
      this.phone,
      this.joinDate,
      this.address,
      this.authToken,
      this.id,
      this.status});

  factory Vendor.fromJson(Map<String, dynamic> json) => _$VendorFromJson(json);

  /// Connect the generated [_$VendorToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$VendorToJson(this);

  void setToken() async {
    if (authToken != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setString("AuthToken", authToken!);
      print(pref.getString("AuthToken"));
    } else {
      throw Exception("Auth Token is null");
    }
    notifyListeners();
  }

  void addVendorData({required Vendor vendor}) {
    // print("add -> ${vendor.name}");
    name = vendor.name;
    shopName = vendor.shopName;
    id = vendor.id;
    email = vendor.email;
    phone = vendor.phone;
    joinDate = vendor.joinDate;
    address = vendor.address;
    authToken = vendor.authToken;
    status = vendor.status;
    notifyListeners();
  }
}
