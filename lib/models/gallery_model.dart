import 'package:calvcare/entity/gallery_entity.dart';

class GalleryModel extends Gallery {
  const GalleryModel({int? id, String? url}) : super(id: id, url: url);

  factory GalleryModel.fromJson(dynamic json) {
    const empty = null;
    return GalleryModel(id: json['id'] ?? empty, url: json['url'] ?? empty);
  }
}
