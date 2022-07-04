import 'package:calvcare/entity/message_entity.dart';
import 'package:calvcare/models/product_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

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
    parseDate(Timestamp date) {
      final dateTime = Timestamp(date.seconds, date.nanoseconds).seconds;
      return DateTime.fromMillisecondsSinceEpoch(dateTime * 1000);
    }

    const empty = null;
    return MessageModel(
        message: json['message'] ?? empty,
        userId: json['userId'] ?? empty,
        userName: json['userName'] ?? empty,
        userImage: json['userImage'] ?? empty,
        isFormUser: json['isFormUser'] ?? empty,
        product: ProductModel.fromJson(json['product']),
        createdAt: parseDate(json['createdAt']),
        updatedAt: parseDate(json['updatedAt']));
  }
}
