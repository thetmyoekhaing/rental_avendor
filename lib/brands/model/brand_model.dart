import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'brand_model.g.dart';

@JsonSerializable()
class Brand {
  @JsonKey(name: "_id")
  String? id;
  String? name;

  Brand({this.id, this.name});

  factory Brand.fromJson(Map<String, dynamic> json) => _$BrandFromJson(json);

  /// Connect the generated [_$BrandToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$BrandToJson(this);
}

class BrandList extends GetxController {
  List<Brand> brandsList = [];

  void addBrands({required Brand brand}) {
    bool isBrandExists =
        brandsList.any((existingBrand) => existingBrand.id == brand.id);
    if (!isBrandExists) {
      brandsList.add(brand);
    }
  }

  List<Brand> getBrandsList() {
    return brandsList;
  }
}
