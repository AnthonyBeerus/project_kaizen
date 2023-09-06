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
);
