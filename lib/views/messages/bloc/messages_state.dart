import 'package:equatable/equatable.dart';
import 'package:vyser/models/index.dart';

class MessagesState extends Equatable {
  @override
  List<Object?> get props => [];
}

class FetchingMessages extends MessagesState {}

class ReFetchingMessages extends MessagesState {}

class MessagesFetched extends MessagesState {
  final List<MessageContent> messages;

  MessagesFetched(this.messages);

  @override
  List<Object?> get props => [messages];
}

class FetchingMessagesFailed extends MessagesState {}
