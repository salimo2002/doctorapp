import 'package:flutter/material.dart';

class AppStyle {
  static TextStyle customText(
    BuildContext context,
    double size,
    FontWeight fontWeight,
  ) {
    return TextStyle(
      fontSize: MediaQuery.of(context).textScaler.scale(size),
      fontWeight: fontWeight,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }
}
