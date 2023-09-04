import 'package:flutter/material.dart';
import 'package:phenom_fitness/themes/colors.dart';

class Routine extends StatefulWidget {
  final String workoutName;
  const Routine({super.key, required this.workoutName});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: secondaryColor,
        elevation: 0,
        title: Text(
          widget.workoutName,
          style: TextStyle(
            color: textColor,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
        centerTitle: true,
      foregroundColor: primaryColor,
      ),
      backgroundColor: secondaryColor,
    );
  }
}
