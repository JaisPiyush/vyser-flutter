// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_context.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageContext _$MessageContextFromJson(Map<String, dynamic> json) =>
    MessageContext(
      payload: MessageContextPayload.fromJson(
          json['payload'] as Map<String, dynamic>),
      user: MessageContextUser.fromJson(json['user'] as Map<String, dynamic>),
      actionId: json['actionId'] as String?,
    );

Map<String, dynamic> _$MessageContextToJson(MessageContext instance) =>
    <String, dynamic>{
      'payload': instance.payload.toJson(),
      'user': instance.user.toJson(),
      'actionId': instance.actionId,
    };
