import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: Colors.blue.shade700,
    secondary: Colors.grey,
    tertiary: Colors.white,
    surfaceTint: Colors.black,
    surfaceDim: Colors.black,
    surfaceBright: Colors.black,
    scrim: const Color.fromARGB(255, 50, 50, 50),
    onPrimary: Colors.white,
  ),
);
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: Colors.blue.shade700,
    secondary: Colors.grey,
    tertiary: Colors.black,
    surfaceTint: Colors.blue.shade100,
    surfaceDim: Colors.blue.shade100,
    surfaceBright: Colors.white,
    scrim: Colors.white,
    onPrimary: Colors.white,
  ),
);
