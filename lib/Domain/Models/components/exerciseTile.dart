import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ExerciseTile extends StatefulWidget {
  final String exerciseName;
  final String weight;
  final String sets;
  final String reps;
  final bool isCompleted;
  void Function(bool?)? onCheckBoxChanged;

  ExerciseTile({
    super.key,
    required this.exerciseName,
    required this.weight,
    required this.sets,
    required this.reps,
    required this.isCompleted,
    required this.onCheckBoxChanged,

  });

  @override
  State<ExerciseTile> createState() => _ExerciseTileState();
}

class _ExerciseTileState extends State<ExerciseTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              widget.exerciseName,
              style: const TextStyle(
                fontSize: 20,
                fontFamily: 'Roboto',
                fontWeight: FontWeight.bold,
              ),
              
            ),
          ),
          SizedBox(
            height: 120,
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 32),
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: Slidable(
                endActionPane: ActionPane(
                  motion: const StretchMotion(),
                  children: [
                    SlidableAction(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      onPressed: ((context) {}),
                      backgroundColor: Colors.redAccent,
                      icon: Icons.delete,
                    ),
                  ],
                ),
                child: ListTile(
                  leading: TextButton(
                    onPressed: () {
                    },
                    child: const Text('1'),
                  ),
                  subtitle: SizedBox(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Chip(
                          padding: const EdgeInsets.all(10),
                          label: Text('${widget.weight}kg'),
                        ),
                        Chip(
                          padding: const EdgeInsets.all(10),
                          label: Text('${widget.reps}reps'),
                        ),
                        Chip(
                          padding: const EdgeInsets.all(10),
                          label: Text('${widget.sets}sets'),
                        ),
                      ],
                    ),
                  ),
                  trailing: Checkbox(
                    value: widget.isCompleted, 
                    onChanged: (value) => widget.onCheckBoxChanged!(value)),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: ElevatedButton( 
              onPressed: () {
                // Handle button press here
              },
              child: const Text("+ Add Set"),
            ),
          ),
        ],
      ),
    );
  }
}
