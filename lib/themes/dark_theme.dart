import 'package:flutter/material.dart';
import 'package:phenom_fitness/themes/colors.dart';

ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: darkColor,
    primary: secondaryColor,
    secondary: brandColorDarkTheme,
    tertiary: lightColor,
    primaryContainer: darkBoxShadowBottomRight,
    secondaryContainer: darkBoxShadowTopLeft,
  ),
  cardTheme: CardTheme(
    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15.0),
    color: darkBoxShadowTopLeft,
    elevation: 20,
    shadowColor: darkBoxShadowBottomRight,
  ),
);