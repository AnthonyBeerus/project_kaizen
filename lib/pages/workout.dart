// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:phenom_fitness/themes/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class Workout extends StatefulWidget {
  const Workout({super.key});

  @override
  State<Workout> createState() => _WorkoutState();
}

class _WorkoutState extends State<Workout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SpeedDial(
          backgroundColor: secondaryColor,
          overlayColor: primaryColor,
          overlayOpacity: 0.4,
          animatedIcon: AnimatedIcons.view_list,
          spacing: 10,
          spaceBetweenChildren: 10,
          children: [
            SpeedDialChild(
              backgroundColor: secondaryColor,
              child: const Icon(Icons.bar_chart, color: Colors.white,),
              labelWidget: const Text(
                'Workout History',
                ),
            ),
          ],
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