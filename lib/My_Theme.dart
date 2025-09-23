import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyThemeData {
  static ThemeData lightTheme = ThemeData(
    textTheme: TextTheme(
        bodyLarge: GoogleFonts.elMessiri(
          fontWeight: FontWeight.bold,
          fontSize: 30,
          color: Colors.black,
        ),
      bodyMedium: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w600,
        fontSize: 25,
        color: Colors.black,

      ),
      bodySmall: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w500,
        fontSize: 20,
        color: Colors.black,

      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.black,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        backgroundColor: Color(0xFFB7935F),
        type: BottomNavigationBarType.fixed,
    ),
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      elevation: 0,
      titleTextStyle: GoogleFonts.elMessiri(
        fontWeight: FontWeight.w700,
        fontSize: 30,
        color: Colors.black,

      ),
    ),
  );
  static ThemeData DarkTheme = ThemeData(


  );
}
