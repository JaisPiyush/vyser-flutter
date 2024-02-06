import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/message_content/message_context_payload.dart';
import 'package:vyser/models/message_content/message_context_user.dart';

part 'message_context.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageContext {
  MessageContext({
    required this.payload,
    required this.user,
    this.actionId,
  });

  final MessageContextPayload payload;
  final MessageContextUser user;
  final String? actionId;

  factory MessageContext.fromJson(Map<String, dynamic> json) =>
      _$MessageContextFromJson(json);

  Map<String, dynamic> toJson() => _$MessageContextToJson(this);
}
