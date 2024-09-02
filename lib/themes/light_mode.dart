import 'package:flutter/material.dart';

ThemeData lightMode = ThemeData(
  colorScheme: ColorScheme.light(
    background: Colors.grey
        .shade300, // A light grey for the background for a neutral and soft look
    primary: Colors.blueGrey
        .shade500, // A medium blue-grey for primary elements for a calm and professional feel
    secondary: Colors.teal
        .shade400, // A teal for secondary elements to add a touch of color without being overpowering
    tertiary: Colors
        .white, // Pure white for tertiary elements to keep things clean and simple
    inversePrimary: Colors.blueGrey
        .shade700, // A darker blue-grey for inverse primary elements to ensure good contrast
  ),
);
