import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class LabelContainer extends StatelessWidget {
  const LabelContainer({super.key, required this.label, required this.icon});
final String label;
final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.blue.shade500,
      ),
      child: Row(
        children: [
          SizedBox(width: 20),
          Text(
            label,
            style: AppStyle.containerText(
              context,
              28,
              FontWeight.bold,
              Theme.of(context).colorScheme.scrim,
            ),
          ),
          Spacer(),
          Icon(
            icon,
            color: Theme.of(context).colorScheme.scrim,
            size: 50,
          ),
        ],
      ),
    );
  }
}
