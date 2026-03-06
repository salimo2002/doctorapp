import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bidi_text/bidi_text_field.dart';

class ChatTextField extends StatelessWidget {
  const ChatTextField({
    super.key,
    required this.message,
    required this.hint,
    this.suffixIcon,
  });

  final TextEditingController message;
  final String hint;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return BidiTextField(
      controller: message,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Colors.white30,
        filled: true,
        hint: Text(
          hint,
          textDirection: TextDirection.rtl,
          style: AppStyle.customText(context, 18, FontWeight.normal),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
