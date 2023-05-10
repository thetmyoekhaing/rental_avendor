import 'package:json_annotation/json_annotation.dart';
part 'vendor_model.g.dart';

@JsonSerializable()
class Vendor {
  final String? name;

  @JsonKey(name: "shop_name")
  final String? shopName;
  final String? email;
  final String? phone;

  @JsonKey(name: "join_date")
  final String? joinDate;
  final String? address;
  final int? status;

  @JsonKey(name: "auth_token")
  final String? authToken;

  final String? id;
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
}
