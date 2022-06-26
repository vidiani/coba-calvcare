class GalleryModel {
  final int id;
  final String url;

  GalleryModel({
    required this.id,
    required this.url,
  });

  factory GalleryModel.fronJson(Map<String, dynamic> json) {
    return GalleryModel(
      id: json['id'],
      url: json['url'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'url': url,
    };
  }

  static fromJson(gallery) {}
}
