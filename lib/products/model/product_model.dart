import 'package:json_annotation/json_annotation.dart';
import 'package:rental_vendor/brands/model/brand_model.dart';
import 'package:rental_vendor/business/model/business_model.dart';
import 'package:rental_vendor/categories/model/category_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class Product {
  @JsonKey(name: "_id")
  String? id;

  String? name;

  @JsonKey(name: "energy_comsumption")
  String? energyComsumption;

  List<String>? color;

  List<String>? size;

  @JsonKey(name: "extra_device")
  List<String>? extraDevice;

  String? description;

  @JsonKey(name: "main_thambnail")
  MainThambNail? mainThambNail = MainThambNail();

  @JsonKey(name: "multi_images")
  List<MultiImages>? multiImages;

  int? price;

  @JsonKey(name: "product_code")
  String? productCode;

  Brand? brand = Brand();

  List<CategoryModel>? category;

  @JsonKey(name: "duration_date")
  String? durationDate;

  @JsonKey(name: "insurence_date")
  String? insurenceData;

  List<Business>? business;

  Product(
      {this.brand,
      this.business,
      this.category,
      this.color,
      this.description,
      this.durationDate,
      this.energyComsumption,
      this.extraDevice,
      this.id,
      this.insurenceData,
      this.mainThambNail,
      this.multiImages,
      this.name,
      this.price,
      this.productCode,
      this.size});

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  /// Connect the generated [_$ProductToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class MainThambNail {
  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "media_link")
  String? mediaLink;
  MainThambNail({this.id, this.mediaLink});

  factory MainThambNail.fromJson(Map<String, dynamic> json) =>
      _$MainThambNailFromJson(json);

  /// Connect the generated [_$MainThambNailToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MainThambNailToJson(this);
}

@JsonSerializable()
class MultiImages {
  @JsonKey(name: "_id")
  String? id;

  @JsonKey(name: "media_link")
  String? mediaLink;
  MultiImages({this.id, this.mediaLink});
  factory MultiImages.fromJson(Map<String, dynamic> json) =>
      _$MultiImagesFromJson(json);

  /// Connect the generated [_$MultiImagesToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$MultiImagesToJson(this);
}
