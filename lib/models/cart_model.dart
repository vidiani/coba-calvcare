import 'package:calvcare/entity/cart_entity.dart';

class CartModel extends Cart {
  const CartModel({
    int? id,
    dynamic product,
    int? quantity,
  }) : super(id: id, product: product, quantity: quantity);

  factory CartModel.fromJson(dynamic json) {
    const empty = null;
    return CartModel(
      id: json['id'] ?? empty,
      product: json['product'] ?? [],
      quantity: json['quantity'] ?? empty,
    );
  }

  double getTotalPrice() {
    return product.price * quantity;
  }
}
