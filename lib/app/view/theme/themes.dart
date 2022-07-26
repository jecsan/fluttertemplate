import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Themes {
  static ThemeData buildLightThemeData() {
    return ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.orange,
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData.light().textTheme,
        ));
  }

  static ThemeData buildDarkThemeData() {
    return ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.orange,
        textTheme: GoogleFonts.latoTextTheme(
          ThemeData.dark().textTheme,
        ));
  }

  static ButtonThemeData buildButtonTheme() {
    return ButtonThemeData();
  }
}
