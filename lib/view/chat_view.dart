import 'package:doctorapp/model/chat_model.dart';
import 'package:doctorapp/services/chat_service.dart';
import 'package:doctorapp/utils/app_style.dart';
import 'package:doctorapp/widgets/chat_bubble.dart';
import 'package:doctorapp/widgets/chat_text_field.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ChatView extends StatefulWidget {
  const ChatView({super.key});

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  TextEditingController message = TextEditingController();
  FocusNode messageFocus = FocusNode();
  ScrollController scrollController = ScrollController();
  List<ChatModel> messages = [];
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    messages.add(
      ChatModel(
        content:
            "مرحباً بك. أنا مساعدك الطبي المخصص للبحث في دليل الأدوية بذكاء. كيف يمكنني مساعدتك اليوم؟",
        sendByMe: false,
      ),
    );
  }

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
                  width: 60,
                  height: 60,
                ),
                Spacer(),
                Text(
                  'المساعد الطبي الذكي',
                  style: AppStyle.customText(
                    context,
                    AppStyle.h2,
                    FontWeight.bold,
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                controller: scrollController,
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return ChatBubble(
                    message: messages[index].content,
                    sendByMe: messages[index].sendByMe,
                  );
                },
              ),
            ),
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 45,
                    child: ChatTextField(
                      focusNode: messageFocus,
                      hint: 'اكتب سؤالك هنا',
                      controller: message,
                    ),
                  ),
                ),
                isLoading
                    ? Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: SizedBox(
                          width: 20,
                          height: 20,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                      )
                    : IconButton(
                        color: Theme.of(context).colorScheme.primary,
                        onPressed: sendMessage,
                        icon: Icon(Icons.send),
                      ),
              ],
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }

  void sendMessage() async {
    String query = message.text.trim();
    if (query.isEmpty || isLoading) return;

    message.clear();

    setState(() {
      messages.add(ChatModel(content: query, sendByMe: true));
      isLoading = true;
    });

    _scrollToBottom();

    String response = await ChatService.askAboutDrug(query);

    setState(() {
      messages.add(ChatModel(content: response, sendByMe: false));
      isLoading = false;
    });

    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (scrollController.hasClients) {
        scrollController.animateTo(
          scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 200),
          curve: Curves.easeOut,
        );
      }
    });
  }
}
