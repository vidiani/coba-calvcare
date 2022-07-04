import 'package:calvcare/entity/gallery_entity.dart';

class GalleryModel extends Gallery {
  const GalleryModel({int? id, String? url, int? productId}) : super(id: id, url: url, productId: productId);

  factory GalleryModel.fromJson(dynamic json) {
    const empty = null;
    return GalleryModel(id: json['id'] ?? empty, url: json['url'], productId: json['products_id'] ?? empty);
  }
}
