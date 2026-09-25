import 'package:flutter/material.dart';

class AppTheme {
  // ---COULEURS TALENTX DARK ---
  static const Color darkBackground = Color(0xFF12122A);
  static const Color darkSurface = Color(0xFF1E1E3A);
  static const Color darkBorder = Color(0xFF2A2A4A);
  static const Color darkPrimary = Color(0xFF8A2BE2);
  static const Color darkSuccess = Color(0xFFFF5722);
  static const Color darkTextPrimary = Color(0xFFFFFFFF);
  static const Color darkTextSecondary = Color(0xFF9A9AB0);

  // ---COULEURS TALENTX LIGHT ---
  static const Color lightBackground = Color(0xFFF8F7FF);
  static const Color lightSurface = Color(0xFFFFFFFF);
  static const Color lightBorder = Color(0xFFE8E6F0);
  static const Color lightPrimary = Color(0xFF8A2BE2);
  static const Color lightSuccess = Color(0xFFFF5722);
  static const Color lightTextPrimary = Color(0xFF12122A);
  static const Color lightTextSecondary = Color(0xFF6B6B8A);

  /// Theme Sombre TalentX (Dark Mode)
  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: darkBackground,
      colorScheme: const ColorScheme.dark(
        primary: darkPrimary,
        secondary: darkSuccess,
        surface: darkSurface,
        onSurface: darkTextPrimary,
        outline: darkBorder,
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: darkBorder, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkTextPrimary,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkSuccess,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        ),
      ),
    );
  }

  /// Theme Clair TALENTX (Light Mode)
  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: lightBackground,
      colorScheme: const ColorScheme.light(
        primary: lightPrimary,
        secondary: lightSuccess,
        surface: lightSurface,
        onSurface: lightTextPrimary,
        outline: lightBorder,
      ),
      cardTheme: CardThemeData(
        color: lightSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: const BorderSide(color: lightBorder, width: 1),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: lightSurface,
        foregroundColor: lightTextPrimary,
        elevation: 0,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: lightSuccess,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),

          ),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12,),
        )
      ),
    );
  }
}
