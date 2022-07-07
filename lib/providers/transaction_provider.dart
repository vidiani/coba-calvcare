import 'package:calvcare/models/cart_model.dart';
import 'package:calvcare/services/transaction_service.dart';
import 'package:flutter/material.dart';

class TransactionProvider with ChangeNotifier {
  Future<bool> checkout(String token, List<CartModel> carts, double totalPrice,
      String street) async {
    try {
      if (await TransactionService()
          .checkout(token, carts, totalPrice, street)) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      print(e);
      return false;
    }
  }
}
