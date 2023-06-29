import 'package:flutter/material.dart';

class PeertubeTheme {
  static final darkTheme = ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      cardColor: Colors.black,
      dividerColor: Colors.red,
      bottomNavigationBarTheme:
          BottomNavigationBarThemeData(selectedItemColor: Colors.red),
      filledButtonTheme: FilledButtonThemeData(
        style: ButtonStyle(
          shape: MaterialStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0), // Острые углы (0.0)
            ),
          ),
          backgroundColor: MaterialStateProperty.all<Color>(
            Colors.red,
          ),
        ),
      ),
      floatingActionButtonTheme:
          FloatingActionButtonThemeData(backgroundColor: Colors.red),
      inputDecorationTheme: const InputDecorationTheme(
        hintStyle: TextStyle(color: Colors.red),
        helperStyle: TextStyle(color: Colors.red),
        prefixIconColor: Colors.red,
        suffixIconColor: Colors.red,
        errorStyle: TextStyle(color: Color.fromARGB(255, 255, 0, 0)),
        alignLabelWithHint: true,
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.red),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.zero,
          borderSide: BorderSide(color: Colors.white),
        ),
        labelStyle: TextStyle(color: Colors.red),
      ),
      textSelectionTheme: const TextSelectionThemeData(cursorColor: Colors.red),
      appBarTheme: const AppBarTheme());
}
