import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class OpenOrClosePharmasy extends StatelessWidget {
  const OpenOrClosePharmasy({super.key, required this.isOpen});
  final bool isOpen;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: isOpen ? Color(0xffd7f2e9) : Color.fromARGB(255, 232, 194, 194),
        borderRadius: BorderRadius.circular(8),
      ),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        spacing: 4,
        children: [
          Icon(
            isOpen ? Icons.lock_open : Icons.lock_outline,
            color: isOpen
                ? Color(0xff05bf80)
                : Color.fromARGB(255, 177, 70, 70),
          ),
          Text(
            isOpen ? 'مفتوحة الان' : 'مغلقة الان',
            style: AppStyle.containerText(
              context,
              14,
              FontWeight.bold,
              isOpen ? Color(0xff05bf80) : Color.fromARGB(255, 177, 70, 70),
            ),
          ),
        ],
      ),
    );
  }
}
