// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/themes/colors.dart';
import 'package:phenom_fitness/widgets/floating_action.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        elevation: 0,
        title: Text(
          'W O R K O U T S',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'Workout',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
            ),
        ),
      ),
    );
  }
}