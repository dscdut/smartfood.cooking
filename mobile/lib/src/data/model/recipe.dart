
class Recipe {
  final int id;
  final String nameRecipe;
  final String level;
  final String decription;
  Recipe({
    required this.id,
    required this.nameRecipe,
    required this.level,
    required this.decription,
  });


  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': nameRecipe,
      'level': level,
      'decription': decription,
    };
  }

  factory Recipe.fromJson(Map<String, dynamic> map) {
    return Recipe(
      id: map['id']?.toInt() ?? 0,
      nameRecipe: map['name'] ?? '',
      level: map['level'] ?? '',
      decription: map['decription'] ?? '',
    );
  }
}
