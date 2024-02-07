import 'package:flutter/material.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/widgets/simple_chat_bubble.dart';

class ChatBubble extends StatefulWidget {
  const ChatBubble({
    super.key,
    this.width,
    this.height,
    required this.msg,
  });

  final double? width;
  final double? height;
  final MessageContent msg;

  @override
  State<ChatBubble> createState() => _ChatBubbleState();
}

class _ChatBubbleState extends State<ChatBubble> {
  @override
  Widget build(BuildContext context) {
    if (widget.msg.richContent.length == 1) {
      return SimpleChatBubble(
          width: widget.width,
          height: widget.height,
          content: widget.msg.richContent[0],
          msgCtx: widget.msg.context);
    } else if (widget.msg.richContent.length > 1) {
      return Column(
        children: widget.msg.richContent
            .map((content) => SimpleChatBubble(
                width: widget.width,
                height: widget.height,
                content: content,
                msgCtx: widget.msg.context))
            .toList(),
      );
    }
    return Container();
  }
}
