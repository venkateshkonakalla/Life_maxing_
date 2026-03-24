import 'package:flutter/material.dart';

final ThemeData darkTheme = ThemeData.dark().copyWith(
  scaffoldBackgroundColor: const Color(0xFF0D0D0D),
  primaryColor: Colors.blueAccent,

  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.black,
    elevation: 0,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
  ),

  cardColor: const Color(0xFF1A1A1A),

  textTheme: const TextTheme(
    bodyLarge: TextStyle(color: Colors.white),
    bodyMedium: TextStyle(color: Colors.white),
    bodySmall: TextStyle(color: Colors.white70),
  ),

  inputDecorationTheme: const InputDecorationTheme(
    border: OutlineInputBorder(),
    hintStyle: TextStyle(color: Colors.grey),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.white24),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.blueAccent),
    ),
  ),
);
