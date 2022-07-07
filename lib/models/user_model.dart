import 'package:calvcare/entity/user_entity.dart';

class UserModel extends User {
  const UserModel(
      {int? id,
      String? name,
      String? email,
      String? username,
      String? street,
      String? profilePhotoUrl,
      String? token})
      : super(
            id: id,
            name: name,
            email: email,
            username: username,
            street: street,
            profilePhotoUrl: profilePhotoUrl,
            token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      street: json['street'],
      profilePhotoUrl: json['profile_photo_url'],
      token: json['token'],
    );
  }
}
