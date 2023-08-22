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
  void addWorkout(String name) {
    //add workout with a blank list of exercises
    workoutList.add(WorkoutClass(name: name, exercises: []));
  }

  //add an exercise to a workout
  void addExercise(
    String workoutName,
    String exerciseName,
    String weight,
    String reps,
    String sets,
  ) {
    WorkoutClass releventWorkout = workoutList.firstWhere(
      (workout) => workout.name == workoutName
    );
    releventWorkout.exercises.add(
      ExerciseClass(
        name: exerciseName, 
        weight: weight, 
        sets: sets, 
        reps: reps
      ),
    );
  }
  //check off workout
  void checkOffExercise(String workoutName, String exerciseNmae){
    //find the relevent workout and relevent exercise in the workout
  }
  //get length of a given workout


  //return relevent workout object, given the workout name
  

  //return relevent exericsie object, given the workout name + exercise name
}
