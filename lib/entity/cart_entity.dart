import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final int? id;
  final dynamic product;
  final int? quantity;

  const Cart({this.id, this.product, this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'product': product,
      'quantity': quantity,
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [id, product, quantity];
}
