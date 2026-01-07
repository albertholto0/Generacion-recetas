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
  textTheme: GoogleFonts.interTextTheme(),
  colorScheme: lightColorScheme,
  scaffoldBackgroundColor: lightColorScheme.surface,
  appBarTheme: AppBarTheme(
    backgroundColor: lightColorScheme.surface,
    foregroundColor: lightColorScheme.onSurface,
    elevation: 0,
    iconTheme: IconThemeData(color: lightColorScheme.onSurface),
    // titleTextStyle removido (fuente)
  ),
  // textTheme removido (fuente)
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: lightColorScheme.primary,
      foregroundColor: Colors.white,
      // textStyle removido (fuente)
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
    // hintStyle removido (fuente)
  ),
  bottomNavigationBarTheme: BottomNavigationBarThemeData(
    backgroundColor: Color(0xFFFFE5D0),
    selectedItemColor: lightColorScheme.primary,
    unselectedItemColor: Color(0xFF6D6D6D),
    showUnselectedLabels: true,
  ),
  disabledColor: Color(0xFFE0E0E0),
);
