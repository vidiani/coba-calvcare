import 'package:calvcare/models/product_model.dart';

class CartModel {
  final int id;
  final ProductModel product;
  late final int quantity;

  CartModel({
    required this.id,
    required this.product,
    required this.quantity,
  });

  factory CartModel.fromJson(Map<String, dynamic> json) {
    return CartModel(
      id: json['id'],
      product: ProductModel.fromJson(json['product']),
      quantity: json['quantity'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product.toJson(),
      'quantity': quantity,
    };
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}
