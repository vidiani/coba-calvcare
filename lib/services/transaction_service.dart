import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/cart_model.dart';

class TransactionService {
  String baseUrl = 'http://calvcare-backend.test/api';

  Future<bool> checkout(String token, List<CartModel> carts, double totalPrice,
      String street) async {
    var url = '$baseUrl/checkout';
    var headers = {
      'Access-Control-Allow-Origin'
          'Content-Type': 'application/json',
      'Authorization': token,
    };
    var body = jsonEncode({
      'street': street,
      'items': carts
          .map(
            (cart) => {
              'id': cart.product.id,
              'quantity': cart.quantity,
            },
          )
          .toList(),
      'status': "PENDING",
      'total_price': totalPrice,
      'shipping_price': 10.000,
    });
    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Gagal Melakukan Checkout');
    }
  }
}
