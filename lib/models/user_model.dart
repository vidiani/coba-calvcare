import 'package:calvcare/entity/user_entity.dart';

class UserModel extends User {
  const UserModel(
      {int? id,
      String? name,
      String? email,
      String? username,
      String? profilePhotoUrl,
      String? token})
      : super(
            id: id,
            name: name,
            email: email,
            username: username,
            profilePhotoUrl: profilePhotoUrl,
            token: token);

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      username: json['username'],
      profilePhotoUrl: json['profile_photo_url'],
      token: json['token'],
    );
  }
}
