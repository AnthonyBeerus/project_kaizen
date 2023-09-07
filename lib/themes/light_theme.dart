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
    margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
    color: lightBoxShadowTopLeft,
    elevation: 0,
    shadowColor: lightBoxShadowBottomRight,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
);
