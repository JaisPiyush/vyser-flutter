import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'message_context_user.g.dart';

@JsonSerializable()
class MessageContextUser extends Equatable {
  MessageContextUser({
    required this.id,
    required this.isSentByUser,
  });
  final String id;
  final bool isSentByUser;

  factory MessageContextUser.fromJson(Map<String, dynamic> json) =>
      _$MessageContextUserFromJson(json);
  Map<String, dynamic> toJson() => _$MessageContextUserToJson(this);

  @override
  List<Object?> get props => [id, isSentByUser];
}
