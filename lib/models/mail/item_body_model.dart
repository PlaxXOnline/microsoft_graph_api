import 'package:json_annotation/json_annotation.dart';

part 'item_body_model.g.dart';

/// Represents the body of an item, such as a message or event.
@JsonSerializable()
class ItemBody {
  /// The content type of the body. Values: text, html.
  final String? contentType;

  /// The content of the body.
  final String? content;

  ItemBody({
    this.contentType,
    this.content,
  });

  const ItemBody.empty()
      : contentType = null,
        content = null;

  factory ItemBody.fromJson(Map<String, dynamic> json) => _$ItemBodyFromJson(json);
  Map<String, dynamic> toJson() => _$ItemBodyToJson(this);
}
