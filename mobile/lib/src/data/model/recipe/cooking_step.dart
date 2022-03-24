import 'package:equatable/equatable.dart';

class CookingStep extends Equatable {
  final String? content;
  final int? order;
  final List<String>? images;

  const CookingStep({this.content, this.order, this.images});

  factory CookingStep.fromJson(Map<String, dynamic> json) => CookingStep(
        content: json['content'] as String?,
        order: json['order'] as int?,
        images: (json['images'] as List<dynamic>?)
            ?.map((e) => e as String)
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'content': content,
        'order': order,
        'images': images,
      };

  CookingStep copyWith({
    String? content,
    int? order,
    List<String>? images,
  }) {
    return CookingStep(
      content: content ?? this.content,
      order: order ?? this.order,
      images: images ?? this.images,
    );
  }

  @override
  bool get stringify => true;

  @override
  List<Object?> get props => [content, order, images];
}
