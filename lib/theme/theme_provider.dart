import 'package:action_center_data_app/theme/custom_themes.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  bool _isDarkMode = false;

  ThemeProvider() {
    loadTheme();
  }

  ThemeData get themeData => _themeData;
  bool get isDarkMode => _isDarkMode;

  set themeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    themeData = _isDarkMode ? darkMode : lightMode;
    _saveTheme();
  }

  Future<void> loadTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool('isDarkMode') ?? false;
    themeData = _isDarkMode ? darkMode : lightMode;
  }

  Future<void> _saveTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isDarkMode', _isDarkMode);
  }
}
