
import 'package:phenom_fitness/Domain/Models/exercise_class.dart';

class WorkoutClass {
  final String name;
  final List<ExerciseClass> exercises;

  WorkoutClass({
    required this.name,
    required this.exercises,
  });
}
