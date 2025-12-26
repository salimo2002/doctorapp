import 'package:doctorapp/theme/theme.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _currentTheme = lightMode;
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
