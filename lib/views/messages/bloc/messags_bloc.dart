import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/views/messages/bloc/messages_events.dart';
import 'package:vyser/views/messages/bloc/messages_state.dart';

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(MessagesState());

  List<MessageContent> messages = [];
  bool hasFetchedMessages = false;
  bool hasError = false;
}
