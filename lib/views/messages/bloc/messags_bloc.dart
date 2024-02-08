import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/shared/api_call.dart';
import 'package:vyser/shared/custom_actions.dart';
import 'package:vyser/views/messages/bloc/messages_events.dart';
import 'package:vyser/views/messages/bloc/messages_state.dart';

final getIt = GetIt.instance;

class MessagesBloc extends Bloc<MessagesEvent, MessagesState> {
  MessagesBloc() : super(MessagesState()) {
    on<FetchMessagesEvent>(_onFetchMessages);
    on<SendMessageEvent>(_onSendMessage);
  }

  List<MessageContent> messages = [];
  // Messages which are sent to server but not yet confirmed
  List<MessageContent> partialMessages = [];

  String? sessionId;

  List<MessageContent> get getMessages => messages + partialMessages;

  final customActions = getIt.get<CustomActions>();
  final messagesAPI = getIt.get<APICallGroup>().messageAPI!;

  void _onFetchMessages(
      FetchMessagesEvent event, Emitter<MessagesState> emit) async {
    emit(FetchingMessagesState());
    try {
      if (messages.isNotEmpty) {
        emit(MessagesFetchedState(getMessages));
        return;
      }
      final _messages = await messagesAPI.getMessages();
      messages = _messages ?? [];
      sessionId = customActions.getSessionId();
      emit(MessagesFetchedState(getMessages));
    } catch (e) {
      // print(stackTrace);
      emit(FetchingMessagesFailedState());
    }
  }

  void _onSendMessage(
      SendMessageEvent event, Emitter<MessagesState> emit) async {
    partialMessages = [event.message];
    emit(MessagesFetchedState(getMessages));
    try {
      sessionId ??= customActions.getSessionId();
      final _messages = await messagesAPI.sendMessage(
          message: event.message, text: event.text, sessionId: sessionId!);
      messages = messages + _messages;
      partialMessages = [];
      emit(MessagesFetchedState(getMessages));
    } catch (e) {
      emit(SendingMessageFailed());
    }
  }
}
