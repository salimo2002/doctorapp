import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.focusNode,
    required this.ontap,
  });
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      focusNode: focusNode,
      onTap: ontap,
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        hint: Text(
          hint,
          textDirection: TextDirection.rtl,
          style: AppStyle.customText(context, 18, FontWeight.normal),
        ),
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        fillColor: Colors.white30,
        filled: true,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Theme.of(context).colorScheme.primary),
        ),
      ),
    );
  }
}
