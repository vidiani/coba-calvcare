import 'package:calvcare/entity/message_entity.dart';
import 'package:calvcare/models/product_model.dart';

class MessageModel extends Message {
  const MessageModel(
      {String? message,
      int? userId,
      String? userName,
      String? userImage,
      bool? isFormUser,
      ProductModel? product,
      DateTime? createdAt,
      DateTime? updatedAt})
      : super(
            message: message,
            userId: userId,
            userName: userName,
            userImage: userImage,
            isFormUser: isFormUser,
            product: product,
            createdAt: createdAt,
            updatedAt: updatedAt);

  factory MessageModel.fromJson(dynamic json) {
    const empty = null;
    return MessageModel(
        message: json['message'] ?? empty,
        userId: json['userId'] ?? empty,
        userName: json['userName'] ?? empty,
        userImage: json['userImage'] ?? empty,
        isFormUser: json['isFormUser'] ?? empty,
        product: json['product'] ?? empty,
        createdAt: json['createdAt'] ?? empty,
        updatedAt: json['updatedAt'] ?? empty);
  }
}
