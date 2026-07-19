import 'package:doctorapp/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  static const String _themeKey = "appTheme";
  ThemeData _currentTheme = lightMode;
  ThemeData get currentTheme => _currentTheme;
  String get currentThemeName => _currentTheme == darkMode ? 'dark' : 'light';
  IconData get currentIcon =>
      _currentTheme == darkMode ? Icons.light_mode : Icons.dark_mode;
  Future<void> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString(_themeKey);
    if (savedTheme == 'dark') {
      _currentTheme = darkMode;
    } else {
      _currentTheme = lightMode;
    }
    notifyListeners();
  }

  Future<void> toggleTheme() async {
    final prefs = await SharedPreferences.getInstance();
    if (_currentTheme == darkMode) {
      _currentTheme = lightMode;
      await prefs.setString(_themeKey, 'light');
    } else {
      _currentTheme = darkMode;
      await prefs.setString(_themeKey, 'dark');
    }
    notifyListeners();
  }
}
