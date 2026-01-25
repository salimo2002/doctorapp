import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bidi_text/bidi_text_field.dart';

class ChatTextField extends StatefulWidget {
  const ChatTextField({super.key});

  @override
  State<ChatTextField> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends State<ChatTextField> {
  TextEditingController message = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BidiTextField(
      controller: message,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hint: Text(
          'اكتب سؤالك هنا',
          textDirection: TextDirection.rtl,
          style: AppStyle.containerText(
            context,
            18,
            FontWeight.normal,
            Colors.grey.shade600,
          ),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.tertiary),
        ),
      ),
    );
  }
}
