// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_context_user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageContextUser _$MessageContextUserFromJson(Map<String, dynamic> json) =>
    MessageContextUser(
      id: json['id'] as String,
      isSentByUser: json['isSentByUser'] as bool,
    );

Map<String, dynamic> _$MessageContextUserToJson(MessageContextUser instance) =>
    <String, dynamic>{
      'id': instance.id,
      'isSentByUser': instance.isSentByUser,
    };
