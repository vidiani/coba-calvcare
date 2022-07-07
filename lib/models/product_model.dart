import 'package:calvcare/entity/product_entity.dart';
import 'package:calvcare/models/category_model.dart';
import 'package:calvcare/models/gallery_model.dart';

class ProductModel extends Product {
  const ProductModel({
    int? id,
    String? name,
    double? price,
    String? description,
    int? quantity,
    String? tags,
    CategoryModel? category,
    DateTime? createdAt,
    DateTime? updatedAt,
    List<GalleryModel>? galleries,
  }) : super(
            id: id,
            name: name,
            price: price,
            description: description,
            quantity: quantity,
            tags: tags,
            category: category,
            createdAt: createdAt,
            updatedAt: updatedAt,
            galleries: galleries);

  factory ProductModel.fromJson(dynamic json) {
    const empty = null;
    return ProductModel(
      id: json['id'] ?? empty,
      name: json['name'] ?? empty,
      price: json['price'] ?? empty,
      description: json['description'] ?? empty,
      quantity: json['quantity'] ?? empty,
      tags: json['tags'] ?? empty,
      category: CategoryModel.fromJson(json['category']),
      createdAt: json['createdAt'] ?? empty,
      updatedAt: json['updatedAt'] ?? empty,
      galleries: (json['galleries'] as List)
          .map((e) => GalleryModel.fromJson(e))
          .toList(),
    );
  }
}

class UnintializeProductModel extends ProductModel {}
