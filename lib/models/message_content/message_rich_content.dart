import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/message_content/message_chip_option.dart';

part 'message_rich_content.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageRichContent extends Equatable {
  MessageRichContent({
    required this.type,
    this.options,
    this.actionId,
    this.text,
    this.rawUrl,
  });

  String type;
  List<MessageChipOption>? options;
  String? actionId;
  String? text;
  String? rawUrl;

  factory MessageRichContent.fromJson(Map<String, dynamic> json) =>
      _$MessageRichContentFromJson(json);
  Map<String, dynamic> toJson() => _$MessageRichContentToJson(this);

  @override
  List<Object?> get props => [type, options, actionId, text, rawUrl];
}
