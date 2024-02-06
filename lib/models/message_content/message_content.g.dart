// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageContent _$MessageContentFromJson(Map<String, dynamic> json) =>
    MessageContent(
      context: MessageContext.fromJson(json['context'] as Map<String, dynamic>),
      richContent: (json['richContent'] as List<dynamic>)
          .map((e) => MessageRichContent.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MessageContentToJson(MessageContent instance) =>
    <String, dynamic>{
      'context': instance.context.toJson(),
      'richContent': instance.richContent.map((e) => e.toJson()).toList(),
    };
