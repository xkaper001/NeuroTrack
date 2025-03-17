import 'package:flutter/material.dart';

class AppTheme {
  static const Color primaryColor = Color.fromRGBO(
      203, 108, 230, 1); // The purple/blue color from your design
  static const Color secondaryColor = Color.fromRGBO(203, 108, 230, 1);
  static const Color backgroundColor = Colors.white;
  static const Color textColor = Color(0xFF1F2937);
  static const Color subtitleColor = Color(0xFF6B7280);

  static ThemeData lightTheme() {
    return ThemeData(
      primaryColor: const Color.fromARGB(255, 230, 88, 255),
      scaffoldBackgroundColor: backgroundColor,
      colorScheme: const ColorScheme.light(
        primary: Color.fromARGB(255, 229, 98, 252),
        secondary: Color.fromARGB(255, 214, 151, 231),
        surface: backgroundColor,
      ),
      chipTheme: const ChipThemeData(
        color: WidgetStatePropertyAll(primaryColor),
        side: BorderSide.none,
      ),
      filledButtonTheme: FilledButtonThemeData(
          style: ButtonStyle(
        backgroundColor: const WidgetStatePropertyAll(primaryColor),
        minimumSize: const WidgetStatePropertyAll(Size(double.infinity, 56)),
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
        ),
      )),
      dropdownMenuTheme: DropdownMenuThemeData(
        textStyle: const TextStyle(
          fontSize: 16,
          color: Colors.black,
        ),
        menuStyle: const MenuStyle(
          backgroundColor:
              WidgetStatePropertyAll(Color.fromARGB(255, 252, 246, 253)),
        ),
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
          fillColor: Colors.yellowAccent,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(color: Colors.grey.shade600),
          ),
        ),
      ),
    );
  }
}
