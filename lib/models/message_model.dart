import 'package:calvcare/models/product_model.dart';

class MessageModel {
  final String message;
  final int userId;
  final String userName;
  final String userImage;
  final bool isFormUser;
  final ProductModel product;
  final DateTime createdAt;
  final DateTime updatedAt;

  MessageModel({
    required this.message,
    required this.userId,
    required this.userName,
    required this.userImage,
    required this.isFormUser,
    required this.product,
    required this.createdAt,
    required this.updatedAt,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      message: json['message'],
      userId: json['userId'],
      userName: json['userName'],
      userImage: json['userImage'],
      isFormUser: json['isFromUser'],
      product: json['product'].isEmpty
          ? UninitializedProductModel()
          : ProductModel.fromJson(json),
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
      'userId': userId,
      'userName': userName,
      'userImage': userImage,
      'isFromUser': isFormUser,
      'product': product is UninitializedProductModel ? {} : product.toJson(),
      'createdAt': createdAt.toString(),
      'updatedAt': updatedAt.toString(),
    };
  }
}
