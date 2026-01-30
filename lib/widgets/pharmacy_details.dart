import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class PharmacyDetails extends StatelessWidget {
  const PharmacyDetails({
    super.key,
    required this.iconData,
    required this.title,
  });
  final String title;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        spacing: 5,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            style: AppStyle.containerText(
              context,
              16,
              FontWeight.normal,
              Theme.of(context).colorScheme.tertiary,
            ),
          ),
          Icon(
            iconData,
            size: 20,
            color: Theme.of(context).colorScheme.tertiary,
          ),
        ],
      ),
    );
  }
}
