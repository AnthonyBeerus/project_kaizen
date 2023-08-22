// The ExerciseClass represents an individual exercise within a workout.
class ExerciseClass {
  // The name of the exercise, such as "Bicep Curls" or "Squats".
  final String name;

  // The weight used for the exercise, e.g., "10 kg" or "50 lbs".
  final String weight;

  // The number of sets for the exercise, e.g., "4 sets".
  final String sets;

  // The number of repetitions (reps) per set for the exercise, e.g., "10 reps".
  final String reps;

  // Indicates whether the exercise has been completed or not.
  bool isCompleted;

  // Constructor to initialize an ExerciseClass instance.
  ExerciseClass({
    required this.name, // The name of the exercise is required.
    required this.weight, // The weight used is required.
    required this.sets, // The number of sets is required.
    required this.reps, // The number of reps is required.
    this.isCompleted = false, // Whether the exercise is completed (default is false).
  });
}
