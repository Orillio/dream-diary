import 'package:flutter/material.dart';

class DarkTheme {
  static final darkTheme = ThemeData(
    fontFamily: "Roboto",
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2A2831),
      selectedItemColor: Color(0xFFFFE926),
      unselectedItemColor: Color(0xFFCAC4D0),
    ),
    scaffoldBackgroundColor: Color(0xFF1C1B1F)
  );
}