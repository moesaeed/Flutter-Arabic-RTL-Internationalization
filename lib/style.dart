import 'package:flutter/material.dart';

final ThemeData hrTheme = _buildHRTheme();

ThemeData _buildHRTheme() {
  return ThemeData(
      brightness: Brightness.light,
      primaryColor: new Color.fromRGBO(119, 31, 17, 1.0),
      inputDecorationTheme: InputDecorationTheme(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(0.0)))));
}
