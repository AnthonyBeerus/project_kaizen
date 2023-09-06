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
);