import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final int? id;
  final String? name;

  const Category({this.id, this.name});

  Map<String, dynamic> toJson() {
    return {'id': id, 'name': name};
  }

  @override
  String toString() {
    return toJson().toString();
  }

  @override
  List<Object?> get props => [id, name];
}
