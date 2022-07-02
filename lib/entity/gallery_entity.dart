import 'package:equatable/equatable.dart';

class Gallery extends Equatable {
  final int? id;
  final int? productId;
  final String? url;

  const Gallery({this.id, this.productId, this.url});

  Map<String, dynamic> toJson() {
    return {'id': id, 'products_id': productId, 'url': url};
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [id, productId, url];
}
