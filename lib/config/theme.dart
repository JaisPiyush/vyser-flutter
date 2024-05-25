import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: const Color(0xfff2f2f2),
  colorScheme: ColorScheme(
    primary: Colors.black,
    secondary: Colors.grey[600]!,
    surface: Colors.white,
    background: Colors.white,
    error: Colors.red,
    onPrimary: Colors.white,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    onBackground: Colors.black,
    onError: Colors.white,
    brightness: Brightness.light,
  ),
  useMaterial3: true,
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          minimumSize: const Size.fromHeight(50))),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Colors.grey[600]!)),
    filled: true,
    iconColor: Colors.red,
    focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: const BorderSide(color: Colors.black, width: 2)),
  ),
  textTheme: TextTheme(
    titleLarge: GoogleFonts.getFont('Outfit',
        fontWeight: FontWeight.w500, fontSize: 22.0, color: Colors.black),
    titleMedium: GoogleFonts.getFont('Readex Pro',
        fontWeight: FontWeight.normal, fontSize: 18.0, color: Colors.black),
    titleSmall: GoogleFonts.getFont('Readex Pro',
        fontWeight: FontWeight.w500, fontSize: 16.0, color: Colors.black),
    labelLarge: GoogleFonts.getFont('Readex Pro',
        fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.black),
    labelMedium: GoogleFonts.getFont('Readex Pro',
        fontWeight: FontWeight.normal, fontSize: 14.0, color: Colors.black),
    labelSmall: GoogleFonts.getFont(
      'Readex Pro',
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
      color: Colors.grey[600],
    ),
    bodyLarge: GoogleFonts.getFont('Readex Pro',
        fontWeight: FontWeight.normal, fontSize: 16.0, color: Colors.black),
    bodyMedium: GoogleFonts.getFont('Readex Pro',
        fontWeight: FontWeight.normal, fontSize: 14.0, color: Colors.black),
    bodySmall: GoogleFonts.getFont(
      'Readex Pro',
      fontWeight: FontWeight.normal,
      fontSize: 12.0,
      color: Colors.grey[600],
    ),
  ),
);
