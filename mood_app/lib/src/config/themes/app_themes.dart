import 'package:flutter/material.dart';
import 'package:mood_app/src/config/themes/colors.dart';

class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0,
        color: Colors.white,
      ),
      scaffoldBackgroundColor: Colors.white,
      primaryColor: Colors.black,
      accentColor: Colors.black,
      splashColor: Colors.transparent,
      scrollbarTheme: ScrollbarThemeData().copyWith(
        thumbColor: MaterialStateProperty.all(pink1)
      ),
      fontFamily: 'IBM',
    );
  }
}