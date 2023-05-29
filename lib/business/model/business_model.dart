import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'business_model.g.dart';

@JsonSerializable()
class Business {
  @JsonKey(name: "_id")
  String? id;
  String? name;
  String? address;

  Business({this.id, this.address, this.name});

  factory Business.fromJson(Map<String, dynamic> json) =>
      _$BusinessFromJson(json);

  /// Connect the generated [_$BusinessToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BusinessToJson(this);
}

class BusinessList with ChangeNotifier {
  List<Business> businessList = [];

  void addBusinesses({required Business business}) {
    bool isBusinessExists = businessList
        .any((exitstingBusiness) => exitstingBusiness.id == business.id);
    if (!isBusinessExists) {
      businessList.add(business);
      notifyListeners();
    }
  }

  List<Business> getBusinessList() {
    return businessList;
  }
}
