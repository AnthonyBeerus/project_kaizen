import 'package:flutter/material.dart';
import 'package:phenom_fitness/themes/colors.dart';

ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: lightColor,
    primary: secondaryColor,
    secondary: brandColorLightTheme,
    tertiary: darkColor,
    primaryContainer: lightBoxShadowBottomRight,
    secondaryContainer: lightBoxShadowTopLeft,
  ),
  cardTheme: CardTheme(
    margin: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 1.0),
    color: lightBoxShadowTopLeft,
    elevation: 10,
    shadowColor: lightBoxShadowBottomRight,
  ),
);
