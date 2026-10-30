import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CozyTheme {
  // Light palette
  static const cream = Color(0xFFF5EFE6);
  static const beige = Color(0xFFE8DCCB);
  static const terracotta = Color(0xFFC96B4A);
  static const sage = Color(0xFF7FA67A);
  static const brown = Color(0xFF3B2F2F);
  static const muted = Color(0xFF8A7B6B);

  // Dark palette
  static const darkBg = Color(0xFF1F1A17);
  static const darkSurface = Color(0xFF2A2320);
  static const darkTerracotta = Color(0xFFE08A6B);
  static const darkSage = Color(0xFF9BC496);
  static const darkCream = Color(0xFFF0E6D6);

  static ThemeData light() {
    final base = ThemeData.light(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: terracotta,
        brightness: Brightness.light,
      ).copyWith(
        primary: terracotta,
        secondary: sage,
        surface: cream,
        onSurface: brown,
      ),
      scaffoldBackgroundColor: cream,
      textTheme: _textTheme(brown, terracotta),
      appBarTheme: const AppBarTheme(
        backgroundColor: beige,
        foregroundColor: brown,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: beige,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: brown, width: 3),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: terracotta,
          foregroundColor: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(color: brown, width: 3),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: beige,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: brown, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: brown, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: terracotta, width: 3),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: beige,
        selectedColor: terracotta,
        labelStyle: GoogleFonts.rubik(color: brown, fontWeight: FontWeight.w600),
        side: const BorderSide(color: brown, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: beige,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: brown, width: 3),
        ),
        textStyle: GoogleFonts.rubik(color: brown, fontWeight: FontWeight.w600),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: beige,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: brown, width: 2),
          ),
        ),
        textStyle: GoogleFonts.rubik(color: brown, fontWeight: FontWeight.w600),
      ),
    );
  }

  static ThemeData dark() {
    final base = ThemeData.dark(useMaterial3: true);
    return base.copyWith(
      colorScheme: ColorScheme.fromSeed(
        seedColor: darkTerracotta,
        brightness: Brightness.dark,
      ).copyWith(
        primary: darkTerracotta,
        secondary: darkSage,
        surface: darkSurface,
        onSurface: darkCream,
      ),
      scaffoldBackgroundColor: darkBg,
      textTheme: _textTheme(darkCream, darkTerracotta),
      appBarTheme: const AppBarTheme(
        backgroundColor: darkSurface,
        foregroundColor: darkCream,
        elevation: 0,
        centerTitle: false,
      ),
      cardTheme: CardThemeData(
        color: darkSurface,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: darkCream, width: 3),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: darkTerracotta,
          foregroundColor: darkBg,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(6),
            side: const BorderSide(color: darkCream, width: 3),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkSurface,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: darkCream, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: darkCream, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: const BorderSide(color: darkTerracotta, width: 3),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: darkSurface,
        selectedColor: darkTerracotta,
        labelStyle: GoogleFonts.rubik(color: darkCream, fontWeight: FontWeight.w600),
        side: const BorderSide(color: darkCream, width: 2),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: darkSurface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
          side: const BorderSide(color: darkCream, width: 3),
        ),
        textStyle: GoogleFonts.rubik(color: darkCream, fontWeight: FontWeight.w600),
      ),
      dropdownMenuTheme: DropdownMenuThemeData(
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: darkSurface,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(6),
            borderSide: const BorderSide(color: darkCream, width: 2),
          ),
        ),
        textStyle: GoogleFonts.rubik(color: darkCream, fontWeight: FontWeight.w600),
      ),
    );
  }

  static TextTheme _textTheme(Color bodyColor, Color accent) {
    return TextTheme(
      displayLarge: GoogleFonts.rubik(fontSize: 26, fontWeight: FontWeight.w700, color: accent, height: 1.2),
      displayMedium: GoogleFonts.rubik(fontSize: 20, fontWeight: FontWeight.w700, color: accent, height: 1.2),
      titleLarge: GoogleFonts.rubik(fontSize: 18, fontWeight: FontWeight.w700, color: bodyColor, height: 1.2),
      titleMedium: GoogleFonts.rubik(fontSize: 16, fontWeight: FontWeight.w600, color: bodyColor),
      bodyLarge: GoogleFonts.rubik(fontSize: 16, color: bodyColor),
      bodyMedium: GoogleFonts.rubik(fontSize: 14, color: bodyColor),
      labelLarge: GoogleFonts.rubik(fontSize: 12, fontWeight: FontWeight.w700, color: bodyColor),
    );
  }
}
