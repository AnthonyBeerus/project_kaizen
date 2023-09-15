import 'package:flutter/material.dart';
import 'package:phenom_fitness/Data/models/workout_data.dart';
import 'package:phenom_fitness/Domain/Models/components/exerciseTile.dart';

import 'package:provider/provider.dart';

class Routine extends StatefulWidget {
  final String workoutName;
  const Routine({super.key, required this.workoutName});

  @override
  State<Routine> createState() => _RoutineState();
}

class _RoutineState extends State<Routine> {
  //Check box was tapped
  void onCheckBoxChanged(String workoutName, String exerciseName) {
    Provider.of<WorkoutData>(context, listen: false)
        .checkOffExercise(workoutName, exerciseName);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Theme.of(context).colorScheme.background,
            elevation: 0,
            leading: Icon(
              Icons.arrow_back_ios,
              color: Theme.of(context).colorScheme.tertiary,
            ),
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
            itemBuilder: (context, index) => ExerciseTile(
              exerciseName: value
                  .getReleventWorkout(widget.workoutName)
                  .exercises[index]
                  .name,
              weight: value
                  .getReleventWorkout(widget.workoutName)
                  .exercises[index]
                  .weight,
              sets: value
                  .getReleventWorkout(widget.workoutName)
                  .exercises[index]
                  .sets,
              reps: value
                  .getReleventWorkout(widget.workoutName)
                  .exercises[index]
                  .reps,
              isCompleted: value
                  .getReleventWorkout(widget.workoutName)
                  .exercises[index]
                  .isCompleted,
              onCheckBoxChanged: (val) => {
                onCheckBoxChanged(
                  widget.workoutName,
                  value
                      .getReleventWorkout(widget.workoutName)
                      .exercises[index]
                      .name,
                )
              },
            ),
          ),
          
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
