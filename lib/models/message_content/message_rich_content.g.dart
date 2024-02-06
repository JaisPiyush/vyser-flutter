// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_rich_content.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MessageRichContent _$MessageRichContentFromJson(Map<String, dynamic> json) =>
    MessageRichContent(
      type: json['type'] as String,
      options: (json['options'] as List<dynamic>?)
          ?.map((e) => MessageChipOption.fromJson(e as Map<String, dynamic>))
          .toList(),
      actionId: json['actionId'] as String?,
      text: json['text'] as String?,
      rawUrl: json['rawUrl'] as String?,
    );

Map<String, dynamic> _$MessageRichContentToJson(MessageRichContent instance) =>
    <String, dynamic>{
      'type': instance.type,
      'options': instance.options?.map((e) => e.toJson()).toList(),
      'actionId': instance.actionId,
      'text': instance.text,
      'rawUrl': instance.rawUrl,
    };
