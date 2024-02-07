import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/message_content/message_context.dart';
import 'package:vyser/models/message_content/message_rich_content.dart';

part 'message_content.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageContent extends Equatable {
  MessageContent({
    required this.context,
    required this.richContent,
  });

  final MessageContext context;
  final List<MessageRichContent> richContent;

  factory MessageContent.fromJson(Map<String, dynamic> json) =>
      _$MessageContentFromJson(json);
  Map<String, dynamic> toJson() => _$MessageContentToJson(this);

  @override
  List<Object?> get props => [context, richContent];
}
