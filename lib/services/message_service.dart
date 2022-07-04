import 'package:calvcare/models/message_model.dart';
import 'package:calvcare/models/product_model.dart';
import 'package:calvcare/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageService {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<List<MessageModel>> getMessageByUserId({int? userId}) {
    try {
      return firestore
          .collection('messages')
          .where('userId', isEqualTo: userId)
          .snapshots()
          .map((QuerySnapshot list) {
        var result = list.docs.map((DocumentSnapshot message) {
          return MessageModel.fromJson(message.data());
        }).toList();

        result.sort((MessageModel a, MessageModel b) =>
            (a.createdAt?.compareTo(b.createdAt!))!);

        return result;
      });
    } catch (e) {
      print('kenapa error: $e');
      throw Exception(e);
    }
  }

  Future<void> addMessage(
      {UserModel? user,
      bool? isFormUser,
      String? message,
      ProductModel? product}) async {
    try {
      firestore.collection('messages').add({
        'userId': user?.id,
        'userName': user?.name,
        'userImage': user?.profilePhotoUrl,
        'isFromUser': isFormUser,
        'message': message,
        'product': product is UnintializeProductModel ? {} : product?.toJson(),
        'createdAt': DateTime.now(),
        'updatedAt': DateTime.now(),
      }).then(
        (value) => print('Pesan Berhasil Dikirim!'),
      );
    } catch (e) {
      throw Exception('Pesan Gagal Dikirim!');
    }
  }
}
