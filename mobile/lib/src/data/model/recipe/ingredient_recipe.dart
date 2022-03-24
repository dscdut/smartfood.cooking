import 'package:equatable/equatable.dart';

class IngredientRecipe extends Equatable {
  final String? name;
  final String? value;
  final String? unit;
  final String? url;


  const IngredientRecipe({this.name, this.value, this.unit, this.url});

  factory IngredientRecipe.fromJson(Map<String, dynamic> json) =>
      IngredientRecipe(
        name: json['name'] as String?,
        value: json['value'] as String?,
        unit: json['unit'] as String?,
        url: json['url'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'value': value,
        'unit': unit,
      };

  IngredientRecipe copyWith({
    String? name,
    String? value,
    String? unit,
    String? url,
  }) {
    return IngredientRecipe(
      name: name ?? this.name,
      value: value ?? this.value,
      unit: unit ?? this.unit,
      url: url ?? this.url,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [name, value, unit, url];
}
