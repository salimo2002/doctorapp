import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class InfoLabel extends StatelessWidget {
  const InfoLabel({super.key, required this.label, required this.icon});
  final String label;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          label,
          style: AppStyle.customText(context, 22, FontWeight.bold),
        ),
        Icon(icon, color: Colors.amber),
      ],
    );
  }
}
