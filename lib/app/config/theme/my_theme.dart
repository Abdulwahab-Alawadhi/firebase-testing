import 'package:firebase/app/core/constants/my_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyTheme {
  static final ThemeData lightTheme = ThemeData(
    textTheme: GoogleFonts.openSansTextTheme(
      ThemeData.light().textTheme,
    ),
    primaryColor: MyColors.primary_500,
    brightness: Brightness.light,
    primaryColorDark: MyColors.primary_500.withOpacity(0.8),
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(
      elevation: 0,
      iconTheme: IconThemeData(color: MyColors.white),
      backgroundColor: MyColors.primary_500,
      foregroundColor: MyColors.white,
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: MyColors.primary_500,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: MyColors.secondary_400,
        foregroundColor: Colors.white, // text color
      ),
    ),
  );
}
