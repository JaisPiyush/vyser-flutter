import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:vyser/models/message_content/message_context_payload.dart';
import 'package:vyser/models/message_content/message_context_user.dart';

part 'message_context.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageContext extends Equatable {
  MessageContext({
    required this.payload,
    required this.user,
    this.actionId,
  });

  MessageContextPayload payload;
  MessageContextUser user;
  String? actionId;

  factory MessageContext.fromJson(Map<String, dynamic> json) =>
      _$MessageContextFromJson(json);

  Map<String, dynamic> toJson() => _$MessageContextToJson(this);

  @override
  List<Object?> get props => [payload, user, actionId];
}
