import 'package:equatable/equatable.dart';

class CookingStep extends Equatable {
	final String? content;
	final int? order;

	const CookingStep({this.content, this.order});

	factory CookingStep.fromJson(Map<String, dynamic> json) => CookingStep(
				content: json['content'] as String?,
				order: json['order'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'content': content,
				'order': order,
			};

	CookingStep copyWith({
		String? content,
		int? order,
	}) {
		return CookingStep(
			content: content ?? this.content,
			order: order ?? this.order,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [content, order];
}
