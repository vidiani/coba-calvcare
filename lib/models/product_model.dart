import 'package:calvcare/entity/product_entity.dart';
import 'package:calvcare/models/category_model.dart';

class ProductModel extends Product {
  const ProductModel(
      {int? id,
      String? name,
      double? price,
      String? description,
      String? tags,
      CategoryModel? category,
      DateTime? createdAt,
      DateTime? updatedAt})
      : super(
            id: id,
            name: name,
            price: price,
            description: description,
            tags: tags,
            category: category,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory ProductModel.fromJson(dynamic json) {
    const empty = null;
    return ProductModel(
        id: json['id'] ?? empty,
        name: json['name'] ?? empty,
        price: json['price'] ?? empty,
        description: json['description'] ?? empty,
        tags: json['tags'] ?? empty,
        category: json['category'] ?? empty,
        createdAt: json['createdAt'] ?? empty,
        updatedAt: json['updatedAt'] ?? empty);
  }
}

class UnintializeProductModel extends ProductModel {}
