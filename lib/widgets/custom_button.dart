
import 'package:doctorapp/utils/app_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.label, required this.onPressed});
  final String label;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(12),
        ),
        backgroundColor: Theme.of(context).colorScheme.primary,
        minimumSize: Size(double.infinity, 50),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: AppStyle.containerText(
          context,
          18,
          FontWeight.bold,
          Theme.of(context).colorScheme.onPrimary,
        ),
      ),
    );
  }
}
