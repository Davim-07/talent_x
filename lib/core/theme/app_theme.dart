import 'package:flutter/material.dart';

class AppTheme {
  // Couleurs TalentX
  static const Color primaryGold = Color(0xFFFFD700);
  static const Color primaryDark = Color(0xFF121212);
  static const Color cardBackground = Color(0xFF1E1E1E);
  static const Color accentPurple = Color(0xFF8A2BE2);

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: primaryDark,
      primaryColor: primaryGold,
      colorScheme: const ColorScheme.dark(
        primary: primaryGold,
        secondary: accentPurple,
        surface: cardBackground,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: primaryDark,
        elevation: 0,
        centerTitle: true,
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: cardBackground,
        selectedItemColor: primaryGold,
        unselectedItemColor: Colors.grey,
      ),
    );
  }
}