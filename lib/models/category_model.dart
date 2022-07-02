import 'package:calvcare/entity/category_entity.dart';

class CategoryModel extends Category {
  const CategoryModel({int? id, String? name}) : super(id: id, name: name);

  factory CategoryModel.fromJson(dynamic json) {
    const empty = null;
    return CategoryModel(id: json['id'] ?? empty, name: json['name'] ?? empty);
  }
}
