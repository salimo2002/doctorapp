import 'package:doctorapp/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightMode;
  String get currentThemeName =>
      _currentTheme == darkMode ? 'dark' : 'light';
  IconData get currentIcon =>
      _currentTheme == darkMode ? Icons.dark_mode : Icons.light_mode;
  ThemeData get currentTheme => _currentTheme;
  set currentTheme(ThemeData theme) {
    _currentTheme = theme;
    notifyListeners();
  }

  void toggleTheme() {
    if (currentTheme == darkMode) {
      currentTheme = lightMode;
    } else {
      currentTheme = darkMode;
    }
  }
}
