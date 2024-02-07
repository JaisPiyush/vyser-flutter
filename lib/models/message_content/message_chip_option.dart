import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_chip_option.g.dart';

@JsonSerializable()
class MessageChipOption extends Equatable {
  MessageChipOption({
    required this.title,
    this.actionId,
  });

  final String title;
  final String? actionId;

  factory MessageChipOption.fromJson(Map<String, dynamic> json) =>
      _$MessageChipOptionFromJson(json);
  Map<String, dynamic> toJson() => _$MessageChipOptionToJson(this);

  @override
  List<Object?> get props => [title, actionId];
}
