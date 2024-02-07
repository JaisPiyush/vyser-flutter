import 'package:chat_bubbles/chat_bubbles.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:vyser/models/index.dart';
import 'package:vyser/shared/custom_actions.dart';

final getIt = GetIt.instance;

class SimpleChatBubble extends StatefulWidget {
  const SimpleChatBubble({
    super.key,
    this.width,
    this.height,
    required this.content,
    required this.msgCtx,
  });

  final double? width;
  final double? height;
  final MessageRichContent content;
  final MessageContext msgCtx;

  @override
  State<SimpleChatBubble> createState() => _SimpleChatBubbleState();
}

class _SimpleChatBubbleState extends State<SimpleChatBubble> {
  final customActions = getIt.get<CustomActions>();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    bool isSender = widget.msgCtx.user.isSentByUser;
    Color color = isSender ? Colors.grey[200]! : theme.colorScheme.primary;
    Color txtColor = isSender ? Colors.black : Colors.white;
    ;
    Color buttonColor = Colors.green;

    if (widget.content.type == 'image') {
      String _url = widget.content.rawUrl!;
      String url = customActions.getPublicUrlFromGSSchema(_url);
      return BubbleNormalImage(
        id: 'id001',
        image: Image.network(url),
        color: color,
        tail: true,
        isSender: isSender,
      );
    }
    if (widget.content.type == 'chips') {
      return Column(
        children: widget.content.options!
            .map((option) => InkWell(
                onTap: () {
                  if (option.actionId != null) {
                    customActions.performNavigationIntent(
                        context, option.actionId!, widget.msgCtx.payload);
                  }
                },
                child: BubbleSpecialOne(
                  text: option.title,
                  color: buttonColor,
                  tail: false,
                  isSender: false,
                  textStyle: const TextStyle(color: Colors.white, fontSize: 14),
                )))
            .toList(),
      );
    }
    return InkWell(
        onTap: () => {
              if (true)
                {
                  if (widget.content.actionId != null)
                    {
                      customActions.performNavigationIntent(context,
                          widget.content.actionId!, widget.msgCtx.payload)
                    }
                  else if (widget.msgCtx.actionId != null)
                    {
                      customActions.performNavigationIntent(context,
                          widget.msgCtx.actionId!, widget.msgCtx.payload)
                    }
                }
            },
        child: BubbleSpecialThree(
          text: widget.content.text!,
          color: color,
          tail: true,
          isSender: isSender,
          textStyle: TextStyle(color: txtColor, fontSize: 14),
        ));
  }
}
