import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brand_model.g.dart';

@JsonSerializable()
class Brand with ChangeNotifier {
  @JsonKey(name: "_id")
  String? id;
  String? name;

  Brand({this.id, this.name});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  /// Connect the generated [_$BrandToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BrandToJson(this);

  void addBrandData({required Brand brand}) {
    print("${brand.id} // ${brand.name}");
    id = brand.id;
    name = brand.name;
    notifyListeners();
  }
}
