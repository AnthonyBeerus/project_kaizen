import 'package:flutter/material.dart';
import 'package:phenom_fitness/Data/models/workout_data.dart';

class ExerciseTile extends StatelessWidget {
  final String exerciseName;
  final String weight;
  final String sets;
  final String reps;
  final bool isCompleted;

  const ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.weight,
    required this.sets,
    required this.reps,
    required this.isCompleted,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(exerciseName),
        subtitle: Row(
          children: [
            Chip(
              label: Text('${weight}kg'),
            ),
            Chip(
              label: Text('${reps}reps'),
            ),
            Chip(
              label: Text('${sets}sets'),
            ),
          ],
        ),
      ),
    );
  }
}
