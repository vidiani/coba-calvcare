import 'package:calvcare/entity/gallery_entity.dart';
import 'package:calvcare/models/category_model.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable {
  final int? id;
  final String? name;
  final double? price;
  final String? description;
  final String? tags;
  final CategoryModel? category;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final List<Gallery>? galleries;

  const Product(
      {this.id,
      this.name,
      this.price,
      this.description,
      this.tags,
      this.category,
      this.createdAt,
      this.updatedAt,
      this.galleries});

  Map<String, dynamic> toJson() {
    var galleries = [];
    for (Gallery gallery in galleries) {
      galleries.add({
        'id': gallery.id,
        'products_id': gallery.productId,
        'url': gallery.url
      });
    }
    return {
      'id': id,
      'name': name,
      'price': price,
      'description': description,
      'tags': tags,
      'category': category,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'galleries': galleries
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props =>
      [id, name, price, description, tags, category, createdAt, updatedAt];
}
