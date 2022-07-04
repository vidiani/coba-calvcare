import 'dart:convert';
import 'dart:html';
import 'package:calvcare/models/user_model.dart';
import 'package:http/http.dart' as http;

class AuthService {
  String basedUrl = 'http://calvcare-backend.test/api';

  Future<UserModel> register({
    name,
    username,
    email,
    password,
  }) async {
    var url = '$basedUrl/register';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'name': name,
      'username': username,
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      dynamic user = UserModel.fromJson(data['user']);
      var typeToken = 'Bearer';
      user.token = '$typeToken ${data['access_token']}';

      return user;
    } else {
      throw Exception('Gagal Register');
    }
  }

  Future<UserModel> login({
    email,
    password,
  }) async {
    var url = '$basedUrl/login';
    var headers = {'Content-Type': 'application/json'};
    var body = jsonEncode({
      'email': email,
      'password': password,
    });

    var response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: body,
    );

    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['data'];
      UserModel user = UserModel.fromJson(data['user']);
      

      return user;
    } else {
      throw Exception('Gagal Login');
    }
  }
}
