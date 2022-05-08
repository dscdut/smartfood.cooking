// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {

  const Ingredient({
    this.id,
    this.name,
    this.categoryId,
    this.url,
  });

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['id'] as int?,
        name: json['name'] as String?,
        categoryId: json['category_id'] as int?,
        url: json['url'] as String?,
      );
  final int? id;
  final String? name;
  final int? categoryId;
  final String? url;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'name': name,
        'category_id': categoryId,
        'url': url,
      };

  Ingredient copyWith({
    int? id,
    String? name,
    int? categoryId,
    String? url,
    String? createdAt,
    String? updatedAt,
    dynamic deletedAt,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
      categoryId: categoryId ?? this.categoryId,
      url: url ?? this.url,
    );
  }

  @override
  List<Object?> get props => [id, name, categoryId, url];

  @override
  bool get stringify => true;
}
