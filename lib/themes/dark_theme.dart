import 'package:flutter/material.dart';

class DarkTheme {
  static final darkTheme = ThemeData(
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      backgroundColor: Color(0xFF2A2831),
      selectedItemColor: Color(0xFFFFE926),
      unselectedItemColor: Color(0xFFCAC4D0),
    ),
    scaffoldBackgroundColor: Color(0xFF1C1B1F),
    textTheme: const TextTheme(
      titleLarge: TextStyle(
        letterSpacing: 1,
        fontFamily: "Druk",
        color: Color(0xFFEDEDED),
        fontWeight: FontWeight.w500,
        fontSize: 22,
      ),
      titleMedium: TextStyle(
        color: Color(0xFFEDEDED),
        fontWeight: FontWeight.w500,
        fontSize: 16,
      ),
      titleSmall: TextStyle(
        color: Color(0xFFEDEDED),
        fontWeight: FontWeight.w500,
        fontSize: 12,
      ),
      labelSmall: TextStyle(
        letterSpacing: 0,
        color: Color(0xFFEDEDED),
        fontWeight: FontWeight.w500,
        fontSize: 13,
      ),
    ),
  );
}