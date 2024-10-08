import 'package:new_chat_app/theme/dark_mode.dart';
import 'package:new_chat_app/theme/light_mode.dart';
import 'package:flutter/material.dart';

class ThemeProvider with ChangeNotifier {
  ThemeData _themeData = lightMode;
  ThemeData get themeData => _themeData;
  bool get isDarkMode => _themeData == darkMode;

  void updateThemeData(ThemeData themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == lightMode) {
      updateThemeData(darkMode);
    } else {
      updateThemeData(themeData);
    }
  }
}
