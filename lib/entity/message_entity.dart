import 'package:calvcare/models/product_model.dart';
import 'package:equatable/equatable.dart';

class Message extends Equatable {
  final String? message;
  final int? userId;
  final String? userName;
  final String? userImage;
  final bool? isFormUser;
  final ProductModel? product;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const Message(
      {this.message,
      this.userId,
      this.userName,
      this.userImage,
      this.isFormUser,
      this.product,
      this.createdAt,
      this.updatedAt});

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFormUser': isFormUser,
      'product': product,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [
        message,
        userId,
        userName,
        userImage,
        isFormUser,
        product,
        createdAt,
        updatedAt
      ];
}
