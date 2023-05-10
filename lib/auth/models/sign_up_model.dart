import 'package:json_annotation/json_annotation.dart';
part 'sign_up_model.g.dart';

@JsonSerializable()
class SignUpModel {
  String? name;
  String? email;
  String? password;

  @JsonKey(name: "join_date")
  String? date;
  String? phone;

  @JsonKey(name: "shop_name")
  String? shopName;

  SignUpModel(
      {this.name,
      this.date,
      this.email,
      this.password,
      this.phone,
      this.shopName});
  factory SignUpModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpModelFromJson(json);

  /// Connect the generated [_$SignUpModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignUpModelToJson(this);
}
