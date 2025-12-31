
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class MidicalSearchTextField extends StatelessWidget {
  const MidicalSearchTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: () {},
      textDirection: TextDirection.rtl,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          color: Theme.of(context).colorScheme.primary,
        ),
        hint: Text(
          'ابحث عن دواء',
          textDirection: TextDirection.rtl,
          style: AppStyle.customText(context, 18, FontWeight.normal),
        ),
        contentPadding: EdgeInsets.symmetric(
          vertical: 10,
          horizontal: 10,
        ),
        fillColor: Colors.white30,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
      ),
    );
  }
}
