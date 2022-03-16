import 'package:equatable/equatable.dart';

import 'ingredient.dart';
import 'step.dart';

class Recipe extends Equatable {
	final int? id;
	final String? name;
	final String? level;
	final String? description;
	final List<Ingredient>? ingredients;
	final List<CookingStep>? steps;

	const Recipe({
		this.id, 
		this.name, 
		this.level, 
		this.description, 
		this.ingredients, 
		this.steps, 
	});

	factory Recipe.fromJson(Map<String, dynamic> json) => Recipe(
				id: json['id'] as int?,
				name: json['name'] as String?,
				level: json['level'] as String?,
				description: json['description'] as String?,
				ingredients: (json['ingredients'] as List<dynamic>?)
						?.map((e) => Ingredient.fromJson(e as Map<String, dynamic>))
						.toList(),
				steps: (json['steps'] as List<dynamic>?)
						?.map((e) => CookingStep.fromJson(e as Map<String, dynamic>))
						.toList(),
			);

	Map<String, dynamic> toJson() => {
				'id': id,
				'name': name,
				'level': level,
				'description': description,
				'ingredients': ingredients?.map((e) => e.toJson()).toList(),
				'steps': steps?.map((e) => e.toJson()).toList(),
			};

	Recipe copyWith({
		int? id,
		String? name,
		String? level,
		String? description,
		List<Ingredient>? ingredients,
		List<CookingStep>? steps,
	}) {
		return Recipe(
			id: id ?? this.id,
			name: name ?? this.name,
			level: level ?? this.level,
			description: description ?? this.description,
			ingredients: ingredients ?? this.ingredients,
			steps: steps ?? this.steps,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props {
		return [
				id,
				name,
				level,
				description,
				ingredients,
				steps,
		];
	}
}
