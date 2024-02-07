import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_context_payload.g.dart';

@JsonSerializable(explicitToJson: true)
class MessageContextPayload extends Equatable {
  MessageContextPayload({
    this.image,
    this.name,
  });

  String? image;
  String? name;

  factory MessageContextPayload.fromJson(Map<String, dynamic> json) =>
      _$MessageContextPayloadFromJson(json);
  Map<String, dynamic> toJson() => _$MessageContextPayloadToJson(this);

  @override
  List<Object?> get props => [image, name];
}
