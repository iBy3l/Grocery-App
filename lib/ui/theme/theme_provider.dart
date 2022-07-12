import 'package:flutter/material.dart';
import 'package:ui_grocery_app/ui/theme/colors.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.system;

  bool get isDart => ThemeMode.dark == themeMode;

  void toogleTheme({required bool brightMoel}) {
    themeMode = brightMoel ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }
}

class AppTheme {
  static ThemeData lightTheme = ThemeData(
      scaffoldBackgroundColor: const Color(0xFFFFFFFFF),
      backgroundColor: const Color(0xFFFFFFFFF),
      primaryColor: lightColorsPrimary,
      colorScheme: ColorScheme.dark().copyWith(secondary: lightColorsSecondary),
      textTheme: const TextTheme(
        headline1: TextStyle(
            color: Color(0xFF060709), fontSize: 8, fontWeight: FontWeight.w700),
      ));
}
