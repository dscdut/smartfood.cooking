import 'package:equatable/equatable.dart';

class Ingredient extends Equatable {
	final String? name;
	final String? value;
	final String? unit;

	const Ingredient({this.name, this.value, this.unit});

	factory Ingredient.fromJson(Map<String, dynamic> json) => Ingredient(
				name: json['name'] as String?,
				value: json['value'] as String?,
				unit: json['unit'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'name': name,
				'value': value,
				'unit': unit,
			};

	Ingredient copyWith({
		String? name,
		String? value,
		String? unit,
	}) {
		return Ingredient(
			name: name ?? this.name,
			value: value ?? this.value,
			unit: unit ?? this.unit,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [name, value, unit];
}
