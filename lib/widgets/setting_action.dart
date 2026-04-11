import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class SettingAction extends StatelessWidget {
  const SettingAction({
    super.key,
    required this.icon,
    required this.title,
    required this.ontap,
  });
  final IconData icon;
  final String title;
  final Function() ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Row(
        children: [
          Icon(Icons.arrow_back_ios_new_outlined),
          Spacer(),
          Text(
            title,
            style: AppStyle.customText(
              context,
              AppStyle.title1,
              FontWeight.bold,
            ),
          ),
          SizedBox(width: 12),
          Icon(icon),
        ],
      ),
    );
  }
}
