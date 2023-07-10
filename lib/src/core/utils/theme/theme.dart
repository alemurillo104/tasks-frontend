import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.lightBlue.shade50,
      fontFamily: 'OpenSans',
      primaryTextTheme: const TextTheme(
        headline1: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 36,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
        headline2: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 30,
          fontWeight: FontWeight.w600,
          color: Colors.black,
        ),
        headline3: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
        headline4: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 15,
          fontWeight: FontWeight.w700,
          color: Colors.black,
        ),
      ),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(
          fontFamily: 'OpenSans',
          fontSize: 15,
          color: Colors.black,
        ),
      ),
    );
  }
}
