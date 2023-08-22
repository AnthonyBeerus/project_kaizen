class ExerciseClass {
  final String name;
  final String weight;
  final String sets;
  final String reps;
  bool isCompleted;

  ExerciseClass({
    required this.name,
    required this.weight,
    required this.sets,
    required this.reps,
    this.isCompleted = false,
  });
}