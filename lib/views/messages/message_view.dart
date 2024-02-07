import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:vyser/views/messages/bloc/messages_state.dart';
import 'package:vyser/views/messages/bloc/messags_bloc.dart';
import 'package:vyser/widgets/chat_bubble.dart';

class MessagesView extends StatelessWidget {
  const MessagesView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MessagesBloc, MessagesState>(builder: (context, state) {
      if (state is MessagesFetchedState) {
        return Padding(
          padding: const EdgeInsets.only(top: 20, bottom: 30),
          child: ListView.builder(
            itemCount: state.messages.length,
            itemBuilder: (context, index) {
              final message = state.messages[index];
              return ChatBubble(msg: message);
            },
          ),
        );
      } else if (state is FetchingMessagesFailedState) {
        return const Center(child: Text('Failed to fetch messages'));
      }
      return const Center(child: CircularProgressIndicator());
    });
  }
}
