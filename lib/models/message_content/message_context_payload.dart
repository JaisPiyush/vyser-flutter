import 'package:json_annotation/json_annotation.dart';

part 'message_context_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageContextPayload {
  MessageContextPayload({
    this.image,
    this.name,
  });

  String? image;
  String? name;

  factory MessageContextPayload.fromJson(Map<String, dynamic> json) =>
      _$MessageContextPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$MessageContextPayloadToJson(this);
}
