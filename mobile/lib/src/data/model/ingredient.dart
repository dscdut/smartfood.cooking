class Ingredient {
  final int id;
  final String name;
  Ingredient({
    required this.id,
    required this.name,
  });

  Ingredient copyWith({
    int? id,
    String? name,
  }) {
    return Ingredient(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }

  factory Ingredient.fromJson(Map<String, dynamic> json) {
    return Ingredient(
      id: json['id'] ?? '',
      name: json['name'] ?? '',
    );
  }

  @override
  String toString() => 'Ingredient(id: $id, name: $name)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Ingredient && other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}
