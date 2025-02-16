import 'package:flutter/material.dart';

class MyTheme {
  static ThemeData theme = ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: const Color(0xFFFFFDAF), // Background Color
    primaryColor: const Color(0xFF47456D), // Header Color
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.transparent, // AppBar Color
      iconTheme: IconThemeData(color: Colors.black), // AppBar Icon Color
      titleTextStyle: TextStyle(
          color: Colors.black,
          fontSize: 20,
          fontWeight: FontWeight.bold
      ),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: Color(0xFF064BB5), // Floating Button Color
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color(0xFF4A4A4A), // Button Color
        foregroundColor: Colors.white, // Button Text Color
        shape: const StadiumBorder(),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
      ),
    ),
    textTheme: const TextTheme(
      bodyLarge: TextStyle(color: Colors.black), // Default Text Color
      bodyMedium: TextStyle(color: Colors.black), // Secondary Text Color
      titleLarge: TextStyle(color: Colors.black, fontSize: 22, fontWeight: FontWeight.bold),
      titleMedium: TextStyle(color: Colors.black, fontSize: 18),
    ),
    cardTheme: const CardTheme(
      color: Color(0xFF000000), // List Card Color
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(12)),
      ),
    ),
  );
}