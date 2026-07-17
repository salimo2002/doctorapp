import 'package:flutter/material.dart';
import 'package:flutter_bidi_text/bidi_text_field.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.hint,
    required this.controller,
    required this.focusNode,
    required this.ontap, this.onChanged,
  });
final Function(String)? onChanged;
  final String hint;
  final TextEditingController controller;
  final FocusNode focusNode;
  final Function() ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 3,
            offset: const Offset(0, -2),
          ),
        ],
      ),
      child: BidiTextField(
        onChanged:onChanged ,
        controller: controller,
        focusNode: focusNode,
        onTap: ontap,
        textDirection: TextDirection.rtl,
        decoration: InputDecoration(
          hint: Text(
            hint,
            textAlign: TextAlign.right,
            style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
          ),
          suffixIcon: Icon(
            Icons.search,
            color: Theme.of(context).colorScheme.primary,
          ),
          filled: true,
          fillColor: Theme.of(context).colorScheme.onPrimaryFixed,
          contentPadding: const EdgeInsets.symmetric(
            vertical: 8,
            horizontal: 20,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}
