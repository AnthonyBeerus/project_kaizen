import 'package:flutter/material.dart';

class workoutBox extends StatefulWidget {
  const workoutBox({super.key});

  @override
  State<workoutBox> createState() => _workoutBoxState();
}

class _workoutBoxState extends State<workoutBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 5.0, horizontal: 15),
        child: Container(
          height: 50,
          color: Theme.of(context).colorScheme.tertiary,
        ),
      ),
    );
  }
}