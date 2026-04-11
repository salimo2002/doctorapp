import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class TextFieldLabel extends StatelessWidget {
  const TextFieldLabel({super.key, required this.label});
  final String label;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppStyle.customText(context, AppStyle.title2, FontWeight.bold),
        ),
        SizedBox(width: 5),
      ],
    );
  }
}
