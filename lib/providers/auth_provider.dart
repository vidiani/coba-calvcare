import 'package:calvcare/models/user_model.dart';
import 'package:calvcare/services/auth_service.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  UserModel? _user;

  UserModel get user => _user!;

  set user(UserModel user) {
    _user = user;
    notifyListeners();
  }

  Future<bool> register({
    name,
    username,
    street,
    email,
    password,
  }) async {
    try {
      UserModel user = await AuthService().register(
        name: name,
        username: username,
        street: street,
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> login({
    email,
    password,
  }) async {
    try {
      final user = await AuthService().login(
        email: email,
        password: password,
      );

      _user = user;
      return true;
    } catch (e) {
      return false;
    }
  }
}
