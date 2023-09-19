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
  //* Function to set the selected Set Type
  void _setSelectedSetType(String setType) {
    setState(() {
      selectedSetType = setType;
      // You can do something with the selected set type here
    });
  }
  String selectedSetType = '';
  //* Function to show the bottom sheet for set type selection
  void setType(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Theme.of(context).colorScheme.background,
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(30.0)
              ),
            ),
            
            height: 400,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'S E T  T Y P E',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Roboto",
                  ),
                ),
                ListTile(
                  title: const Text('Working Set'),
                  onTap: () {
                  _setSelectedSetType('1');
                  Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Warmup Set'),
                  onTap: () {
                    _setSelectedSetType('W');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Failure Set'),
                  onTap: () {
                    _setSelectedSetType('F');
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  title: const Text('Drop Set'),
                  onTap: () {
                    _setSelectedSetType('D');
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          );
        }
      );
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Align(
                  alignment: const Alignment(-1.0, 1.0),
                  child: Text(
                    widget.exerciseName,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
            //*Set card
            //TODO Make this card reuseable and duplicatable upon pressing the Add set button
            Card(
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
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: ListTile(
                    leading: TextButton(
                      //*showcases type of set
                      onPressed: () {
                        setType(context);
                      },
                      child: Text(
                        selectedSetType.isNotEmpty
                            ? selectedSetType // Display selected set type
                            : '1', // Default value or initial value
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    subtitle: SizedBox(
                      width: 70,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Chip(
                            padding: const EdgeInsets.all(5),
                            label: Text('${widget.weight}kg'),
                          ),
                          Chip(
                            padding: const EdgeInsets.all(5),
                            label: Text('${widget.reps}reps'),
                          ),
                          Chip(
                            padding: const EdgeInsets.all(5),
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
            //*Add set
            Align(
              alignment: Alignment.bottomCenter,
              child: ElevatedButton(
                onPressed: () {
                  // Handle button press here
                },
                child: const Text("+ Add Set"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
