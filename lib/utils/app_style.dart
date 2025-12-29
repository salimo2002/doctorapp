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

  static BoxDecoration decoratedBackground(BuildContext context) {
    return BoxDecoration(
      gradient: LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Theme.of(context).colorScheme.surfaceTint,
          Theme.of(context).colorScheme.surfaceDim,
          Theme.of(context).colorScheme.surfaceBright,
        ],
      ),
    );
  }
}
