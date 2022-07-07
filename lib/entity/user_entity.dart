import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int? id;
  final String? name;
  final String? email;
  final String? username;
  final String? street;
  final String? profilePhotoUrl;
  final String? token;

  const User(
      {this.id,
      this.name,
      this.email,
      this.username,
      this.street,
      this.profilePhotoUrl,
      this.token});

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'username': username,
      'street': street,
      'profile_photo_url': profilePhotoUrl,
      'token': token
    };
  }

  @override
  String toString() {
    return toJson.toString();
  }

  @override
  List<Object?> get props =>
      [id, name, email, username, street, profilePhotoUrl, token];
}
