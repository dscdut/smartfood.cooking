class Ingredient {
  final int? id;
  final String? name;
  final int? categoryId;
  final String? url;

  Ingredient({
    this.id,
    this.name,
    this.categoryId,
    this.url,
  });

  @override
  String toString() {
    return 'Ingredient(id: $id, name: $name, categoryId: $categoryId, url: $url)';
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
        id: json['id'] as int?,
        name: json['name'] as String?,
        categoryId: json['category_id'] as int?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
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
}
