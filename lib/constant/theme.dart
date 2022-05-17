import 'package:flutter/material.dart';

class Themes {
  static final light = ThemeData.light().copyWith(
    backgroundColor: Colors.white,
    primaryColor: Colors.black,
    highlightColor: Colors.grey,
    hintColor:Color(0XFF075E54)
  );
  static final dark = ThemeData.dark().copyWith(
      backgroundColor: Colors.black,
      primaryColor: Colors.white,
      highlightColor: Colors.white,
      hintColor: Color(0XFF0b1316));
}
