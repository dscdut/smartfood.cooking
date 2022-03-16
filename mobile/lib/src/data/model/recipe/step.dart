import 'package:equatable/equatable.dart';

class Step extends Equatable {
	final String? content;
	final int? order;

	const Step({this.content, this.order});

	factory Step.fromJson(Map<String, dynamic> json) => Step(
				content: json['content'] as String?,
				order: json['order'] as int?,
			);

	Map<String, dynamic> toJson() => {
				'content': content,
				'order': order,
			};

	Step copyWith({
		String? content,
		int? order,
	}) {
		return Step(
			content: content ?? this.content,
			order: order ?? this.order,
		);
	}

	@override
	bool get stringify => true;

	@override
	List<Object?> get props => [content, order];
}
