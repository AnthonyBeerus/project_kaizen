import 'package:phenom_fitness/Domain/Models/exercise_class.dart';
import 'package:phenom_fitness/Domain/Models/workout_class.dart';

class WorkoutData {
  /*
  WORKOUT DATA STRUCTURE

    -This list contains different workouts
    -Each workout has a name and list of exercises

  */

  List<WorkoutClass> workoutList = [
    WorkoutClass(
      name: 'Upper Body',
      exercises: [
        ExerciseClass(
          name: "Bicep Curls",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
  ];

  //Get list of workouts
  List<WorkoutClass> getWorkoutList() {
    return workoutList;
  }

  //add a workout
  
  //add an exercise to a workout

  //check off workout
}
