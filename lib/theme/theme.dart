import 'package:flutter/material.dart';

ThemeData darkMode = ThemeData(
  colorScheme: ColorScheme.dark(
    primary: const Color.fromARGB(255, 51, 119, 186),
    secondary: Colors.grey,
    tertiary: Colors.white,
    surfaceTint: Colors.black,
    surfaceDim: Colors.black,
    surfaceBright: Colors.black,
    scrim: const Color.fromARGB(255, 50, 50, 50),
    onPrimary: Colors.white,
    inversePrimary: const Color.fromARGB(255, 50, 50, 50),
    inverseSurface: const Color.fromARGB(255, 99, 98, 98),
    onPrimaryFixed: const Color.fromARGB(255, 50, 50, 50),
  ),
);
ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    primary: const Color.fromARGB(255, 21, 98, 174),
    secondary: Colors.grey,
    tertiary: Colors.black,
    surfaceTint: Color.fromARGB(221, 192, 222, 250),
    surfaceDim: Colors.blue.shade100,
    surfaceBright: Colors.white,
    scrim: Color(0xffebf4fb),
    onPrimary: Colors.white,
    inversePrimary: const Color(0xFFbbd5ec),
    inverseSurface: Color(0xffecf5fc),
    onPrimaryFixed: const Color(0xFFd1e6f9),
  ),
);
