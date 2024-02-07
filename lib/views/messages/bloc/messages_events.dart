import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class MessagesEvent extends Equatable {
  const MessagesEvent();

  @override
  List<Object> get props => [];
}

class FetchMessagesEvent extends MessagesEvent {}

class SendMessageEvent extends MessagesEvent {
  final MessageContent message;
  final String text;

  const SendMessageEvent({
    required this.message,
    required this.text,
  });

  @override
  List<Object> get props => [message, text];
}
