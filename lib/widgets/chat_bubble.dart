import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.message, required this.sendByMe});
  final String message;
  final bool sendByMe;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: sendByMe
            ? MainAxisAlignment.start
            : MainAxisAlignment.end,
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 8),
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            constraints: BoxConstraints(
              maxWidth: MediaQuery.of(context).size.width * 0.7,
            ),
            decoration: BoxDecoration(
              color: sendByMe
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.scrim,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              message,
              textDirection: TextDirection.rtl,
              softWrap: true,
              style: AppStyle.containerText(
                context,
                18,
                FontWeight.normal,
                sendByMe
                    ? Theme.of(context).colorScheme.onPrimary
                    : Theme.of(context).colorScheme.tertiary,
              ),
            ),
          ),
          Icon(
            sendByMe ? Icons.person : Icons.rocket_launch,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
