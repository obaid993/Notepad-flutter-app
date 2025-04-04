// ignore_for_file: unused_import, prefer_const_constructors

import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    appBarTheme: AppBarTheme(
        //jlk;
      backgroundColor: Colors.amber
        ),
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple,
      brightness: Brightness.light,
    ),
    useMaterial3: true);

//dark theme
ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.deepPurple, brightness: Brightness.dark),
    useMaterial3: true);
