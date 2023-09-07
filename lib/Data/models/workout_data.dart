import 'package:flutter/material.dart';
import 'package:phenom_fitness/Domain/Models/exercise_class.dart';
import 'package:phenom_fitness/Domain/Models/workout_class.dart';

class WorkoutData extends ChangeNotifier {
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
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
          weight: "10",
          sets: "4",
          reps: "10",
        ),
      ],
    ),
    WorkoutClass(
      name: 'Lower Body',
      exercises: [
        ExerciseClass(
          name: "Deadlift",
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
  //get length of a given workout

  int numberOfExercisesInWorkout(String workoutName) {
    WorkoutClass releventWorkout = getReleventWorkout(workoutName);

    return releventWorkout.exercises.length;
  }

  //add a workout
  void addWorkout(String name) {
    //add workout with a blank list of exercises
    workoutList.add(WorkoutClass(name: name, exercises: []));
    notifyListeners();
  }

  //add an exercise to a workout
  void addExercise(
    String workoutName,
    String exerciseName,
    String weight,
    String reps,
    String sets,
  ) {
    WorkoutClass releventWorkout = getReleventWorkout(workoutName);

    releventWorkout.exercises.add(
      ExerciseClass(name: exerciseName, weight: weight, sets: sets, reps: reps),
    );
    notifyListeners();
  }

  //check off workout
  void checkOffExercise(String workoutName, String exerciseName) {
    //find the relevent workout and relevent exercise in the workout
    ExerciseClass releventExercise =
        getReleventExercise(workoutName, exerciseName);
    //check off the boolean to show user completed the workout
    releventExercise.isCompleted = !releventExercise.isCompleted;
    notifyListeners();
  }

  //return relevent workout object, given the workout name
  WorkoutClass getReleventWorkout(String workoutName) {
    WorkoutClass releventWorkout =
        workoutList.firstWhere((workout) => workout.name == workoutName);
    return releventWorkout;
  }

  //return relevent exericsie object, given the workout name + exercise name
  ExerciseClass getReleventExercise(String workoutName, String exerciseName) {
    //find relevent workout first
    WorkoutClass releventWorkout = getReleventWorkout(workoutName);

    //find relevent exercise in the workout
    ExerciseClass releventExercise = releventWorkout.exercises
        .firstWhere((exercise) => exercise.name == exerciseName);

    return releventExercise;
  }
}
/*
  WORKOUT DATA STRUCTURE

  Glossary:
  - import: Statement used to include external libraries or packages in the code.

  Classes:
  - WorkoutData: Manages workout-related data and operations.
  - ExerciseClass: Represents an exercise with attributes like name, weight, sets, reps, and completion status.
  - WorkoutClass: Represents a workout with a name and a list of exercises.

  Methods:
  - getWorkoutList(): Returns the list of WorkoutClass instances stored in workoutList.
  - numberOfExercisesInWorkout(String workoutName): Returns the number of exercises in a specific workout.
  - addWorkout(String name): Adds a new workout with the given name to the workoutList.
  - addExercise(String workoutName, String exerciseName, String weight, String reps, String sets): Adds a new exercise to a specific workout.
  - checkOffExercise(String workoutName, String exerciseName): Marks an exercise as completed within a specific workout.
  - getReleventWorkout(String workoutName): Returns the WorkoutClass instance corresponding to the given workout name.
  - getReleventExercise(String workoutName, String exerciseName): Returns the ExerciseClass instance corresponding to the given workout and exercise names.

  Variables:
  - workoutList: A list containing instances of WorkoutClass, each representing a workout.

  Overall Purpose:
  The WorkoutData class manages workout-related data and operations. It uses WorkoutClass to represent workouts,
  each containing a list of ExerciseClass instances representing exercises. The class provides methods to add workouts and exercises,
  check off completed exercises, retrieve relevant workouts and exercises, and retrieve the list of workouts.

  The ExerciseClass class represents individual exercises with attributes such as name, weight, sets, reps, and completion status.

  The WorkoutClass class represents workouts with a name and a list of exercises.

  These components work together to create a structure for managing workout data and related functionalities.
*/