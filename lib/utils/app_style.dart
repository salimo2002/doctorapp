import 'package:flutter/material.dart';

class AppStyle {
  static const double h1 = 28;
  static const double h2 = 24;
  static const double h3 = 20;
  static const double title1 = 18;
  static const double title2 = 16;
  static const double body = 15;
  static const double bodySmall = 13;
  static const double caption = 12;
  static TextStyle customText(
    BuildContext context,
    double size,
    FontWeight fontWeight,
  ) {
    return TextStyle(
      fontSize: responsiveFont(context, size),
      fontWeight: fontWeight,
      color: Theme.of(context).colorScheme.tertiary,
    );
  }

  static TextStyle containerText(
    BuildContext context,
    double size,
    FontWeight fontWeight,
    Color color,
  ) {
    return TextStyle(
      fontSize: responsiveFont(context, size),
      fontWeight: fontWeight,
      color: color,
    );
  }

  static double responsiveFont(BuildContext context, double size) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scale = screenWidth / 375;

    double responsiveSize = size * scale;

    if (responsiveSize < size * 0.8) return size * 0.8;
    if (responsiveSize > size * 1.2) return size * 1.2;

    return responsiveSize;
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
