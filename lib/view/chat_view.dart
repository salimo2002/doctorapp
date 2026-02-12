import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/chat_bubble.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: AppStyle.decoratedBackground(context),
      child: Padding(
        padding: const EdgeInsets.only(left: 12, right: 12, top: 40),
        child: Column(
          children: [
            Row(
              children: [
                SizedBox(width: 20),
                Lottie.asset(
                  'assets/animations/robot hello.json',
                  width: 80,
                  height: 80,
                ),
                Spacer(),
                Text(
                  'المساعد الذكي',
                  style: AppStyle.customText(context, 28, FontWeight.bold),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  ChatBubble(
                    message: 'مرحبا كيف يمكنني مساعدتك',
                    sendByMe: false,
                  ),
                  ChatBubble(
                    message: 'مرحبا كيف يمكنني مساعدتك',
                    sendByMe: true,
                  ),
                  ChatBubble(
                    message: 'مرحبا كيف يمكنني مساعدتك',
                    sendByMe: false,
                  ),
                  ChatBubble(
                    message: 'مرحبا كيف يمكنني مساعدتك',
                    sendByMe: true,
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Expanded(child: SizedBox(height: 45, child: ChatTextField())),
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.send,
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
