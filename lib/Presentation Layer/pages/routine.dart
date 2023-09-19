import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
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

  //! Fix RenderFlex bug
  //* Make function for creating new exercise
  Future createNewExercise(BuildContext context) {
    return showModalBottomSheet(
      context: context, 
      builder: (BuildContext context) {
          return const SizedBox(
            height: 500,
            child: Text('New Workout'),
            
        );
      });
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
              onCheckBoxChanged: (val) => 
                onCheckBoxChanged(
                  widget.workoutName,
                  value
                      .getReleventWorkout(widget.workoutName)
                      .exercises[index]
                      .name,
              ),
            ),
            
          ),
          floatingActionButton:SizedBox(
            height: 70,
            width: 70,
            child: Container(
              margin: const EdgeInsets.only(
                right: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                boxShadow: [
                  //bottom right shadow is darker
                  BoxShadow(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    offset: const Offset(4, 4),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                  //top left shadow is lighter
                  BoxShadow(
                    color: Theme.of(context).colorScheme.secondaryContainer,
                    offset: const Offset(-4, -4),
                    blurRadius: 12,
                    spreadRadius: 1,
                  ),
                ],
              ),
              child: SpeedDial(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                foregroundColor: Theme.of(context).colorScheme.secondary,
                animatedIcon: AnimatedIcons.add_event,
                backgroundColor: Theme.of(context).colorScheme.secondary,
                overlayColor: Theme.of(context).colorScheme.background,
                overlayOpacity: 0.9,
                elevation: 0,
                spaceBetweenChildren: 10,
                animatedIconTheme: IconThemeData(
                    color: Theme.of(context).colorScheme.background
                ),
                children: [
                  SpeedDialChild(
                    child: const Icon(Icons.add_circle),
                    labelBackgroundColor:
                        Theme.of(context).colorScheme.background,
                    labelStyle: const TextStyle(
                      fontFamily: "Roboto",
                      fontSize: 18,
                    ),
                    label: ('Add New Routine'),
                    backgroundColor: Theme.of(context).colorScheme.background,
                    elevation: 10,
                    
                  ),
                ],
              ),

              
            ),
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
      ),
    );
  }
}
