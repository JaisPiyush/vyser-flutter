import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class MessagesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchingMessagesState extends MessagesState {}

class MessagesFetchedState extends MessagesState {
  final List<MessageContent> messages;

  MessagesFetchedState(this.messages);

  @override
  List<Object?> get props => [messages];
}

class FetchingMessagesFailedState extends MessagesState {}

class SendingMessageFailed extends MessagesState {}
