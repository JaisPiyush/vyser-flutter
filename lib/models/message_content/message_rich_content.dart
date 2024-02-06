import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/message_content/message_chip_option.dart';

part 'message_rich_content.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageRichContent {
  MessageRichContent({
    required this.type,
    this.options,
    this.actionId,
    this.text,
    this.rawUrl,
  });

  final String type;
  final List<MessageChipOption>? options;
  final String? actionId;
  final String? text;
  final String? rawUrl;

  factory MessageRichContent.fromJson(Map<String, dynamic> json) =>
      _$MessageRichContentFromJson(json);
  Map<String, dynamic> toJson() => _$MessageRichContentToJson(this);
}
