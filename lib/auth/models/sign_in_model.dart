import 'package:json_annotation/json_annotation.dart';
part 'sign_in_model.g.dart';

@JsonSerializable()
class SignInModel {
  String? email;
  String? password;
  SignInModel({this.email, this.password});

  factory SignInModel.fromJson(Map<String, dynamic> json) =>
      _$SignInModelFromJson(json);

  /// Connect the generated [_$SignInModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$SignInModelToJson(this);
}
