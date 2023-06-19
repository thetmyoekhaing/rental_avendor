import 'package:get/get.dart';
import 'package:json_annotation/json_annotation.dart';
part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel {
  @JsonKey(name: "_id")
  String? id;
  String? name;

  CategoryModel({this.id, this.name});
  factory CategoryModel.fromJson(Map<String, dynamic> json) =>
      _$CategoryModelFromJson(json);

  /// Connect the generated [_$CategoryModelToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
}

class CategoryList extends GetxController {
  List<CategoryModel> catList = [];

  void addCats({required CategoryModel cat}) {
    bool isCatExists = catList.any((existingCat) => existingCat.id == cat.id);
    if (!isCatExists) {
      catList.add(cat);
    }
  }

  List<CategoryModel> getCatList() {
    return catList;
  }
}
