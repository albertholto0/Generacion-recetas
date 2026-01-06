import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  primary: Color(0xFFFFA366), // Naranja botón
  onPrimary: Colors.white,
  secondary: Color(0xFFFFE5D0), // Fondo barra/búsqueda
  onSecondary: Color(0xFF000000),
  surface: Color(0xFFFFFFFF),
  onSurface: Color(0xFF000000),
  error: Color(0xFFB00020),
  onError: Colors.white,
);

final lightTheme = ThemeData(
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.background,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.background,
    foregroundColor: lightColorScheme.onBackground,
    elevation: 0,
    iconTheme: IconThemeData(color: lightColorScheme.onBackground),
    titleTextStyle: GoogleFonts.inter(
      color: lightColorScheme.onBackground,
      fontWeight: FontWeight.bold,
      fontSize: 20,
    ),
  ),
  textTheme: GoogleFonts.interTextTheme().copyWith(
    bodyLarge: GoogleFonts.inter(
      color: Color(0xFF000000), // Texto primario negro
      fontSize: 16,
    ),
    bodyMedium: GoogleFonts.inter(
      color: Color(0xFF6D6D6D), // Texto secundario
      fontSize: 14,
    ),
    labelLarge: GoogleFonts.inter(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 16,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: Colors.white,
      textStyle: GoogleFonts.inter(fontWeight: FontWeight.bold),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    filled: true,
    fillColor: Color(0xFFFFE5D0),
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide.none,
    ),
    hintStyle: GoogleFonts.inter(color: Color(0xFF6D6D6D)),
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFE5D0),
    selectedItemColor: lightColorScheme.primary,
    unselectedItemColor: Color(0xFF6D6D6D),
    showUnselectedLabels: true,
  ),
  disabledColor: Color(0xFFE0E0E0),
);
