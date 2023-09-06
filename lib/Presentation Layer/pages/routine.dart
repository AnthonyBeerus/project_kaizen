import 'package:flutter/material.dart';
import 'package:phenom_fitness/Data/models/workout_data.dart';
import 'package:phenom_fitness/themes/colors.dart';
import 'package:provider/provider.dart';

class Routine extends StatefulWidget {
  final String workoutName;
  const Routine({super.key, required this.workoutName});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            title: Text(
              widget.workoutName,
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
              ),
            ),
            centerTitle: true,
          foregroundColor: Theme.of(context).colorScheme.tertiary,
          ),
          body: ListView.builder(
            itemCount: value.numberOfExercisesInWorkout(widget.workoutName),
            itemBuilder: (context, index) => ListTile(
              title: Text(
                value
                  .getReleventWorkout(widget.workoutName)
                  .exercises[index]
                  .name,
              ),
            ), 
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
      ),
    );
  }
}
