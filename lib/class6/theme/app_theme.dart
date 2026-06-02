import 'package:flutter/material.dart';

class AppTheme {
  /// Brand colors
  static const Color primaryBlue = Color(0xFF0E4DA4);
  static const Color primaryLight = Color(0xFFF1565C);
  static const Color accentCyan = Color(0xFF00B4D8);
  static const Color successGreen = Color(0xFF2E7D32);
  static const Color errorRed = Color(0xFFC62828);
  static const Color warningAmber = Color(0xFFF57F17);
  static const Color neutralGrey = Color(0xFF546E7A);

  // Answer state colors
  static const Color correctBg = Color(0xFFE8F5E9);
  static const Color correctBorder = Color(0xFF4CAF50);
  static const Color wrongBg = Color(0xFFFFEBEE);
  static const Color wrongBorder = Color(0xFFEF5350);
  static const Color neutralBg = Color(0xFFF0F4FF);
  static const Color neutralBorder = Color(0xFFBBD0FF);

  // Theme (black and dark)
  // create a getter, static don't need to crate object while funtion call:
  static ThemeData get lightTheme {
    const seedColor = primaryBlue;
    return ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor));
  }

  static ThemeData get darkTheme {
    const seedColor = neutralGrey;
    return ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: seedColor));
  }
}
