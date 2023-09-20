import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:phenom_fitness/Presentation%20Layer/Utilities/text_button.dart';

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
//TODO Decouple all void functions
  //* Function to set the selected Set Type
  void _setSelectedSetType(String setType) {
    setState(() {
      selectedSetType = setType;
      // You can do something with the selected set type here
    });
  }

  String selectedSetType = '';
  //* Function to show alert box when TextButton "Sets" is pressed
  //TODO Fill out Content
  void _setDescription() {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Sets?'),
        content: const Text('A Set...'),
        actions: [
          TextButtonUtils.buildTextButton(
            label: 'OK',
            onPressed: () {
              Navigator.pop(context);
            },
            context: context,
          ),
        ],
      ),
    );
  }

  //* function for Weighing system picker
  //TODO Fix appearance of the buttons
  void _weightDescription() {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Weight'),
        content: const Text('Weight is...'),
        actions: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButtonUtils.buildTextButton(
                label: 'Ok',
                onPressed: () {
                  Navigator.pop(context);
                },
                context: context,
              ),
              TextButtonUtils.buildTextButton(
                label: 'Change Weight Units',
                onPressed: () {
                  _weightSystemChange();
                },
                context: context,
              ),
            ],
          ),
        ],
      ),
    );
  }

  //* Function for change Weighing System
  //TODO add more functionality for picking between weight systems
  void _weightSystemChange() {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        barrierColor: Colors.black.withOpacity(0.6),
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30.0)),
            ),
            height: 400,
          );
        });
  }

  //* Function for describing Reps
  //TODO Fill out content
  void _repDescription() {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Repititon'),
        content: const Text('A rep is...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  void _completionTickDescription() {
    showDialog(
      barrierColor: Colors.black.withOpacity(0.6),
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Completion'),
        content: const Text('Checkmark to track sets...'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Ok'),
          ),
        ],
      ),
    );
  }

  //* Function to show the bottom sheet for set type selection
  //TODO Fix appearance
  void setType(BuildContext context) {
    showModalBottomSheet(
        backgroundColor: Theme.of(context).colorScheme.background,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30)),
        ),
        barrierColor: Colors.black.withOpacity(0.6),
        context: context,
        builder: (BuildContext context) {
          return Container(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.background,
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(30.0)),
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
                Column(
                  children: [
                    ListTile(
                      leading: const Text(
                        '1',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      title: const Text('Working Set'),
                      onTap: () {
                        _setSelectedSetType('1');
                        Navigator.pop(context);
                      },
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Text(
                        'W',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.amber,
                        ),
                      ),
                      title: const Text(
                        'Warmup Set',
                      ),
                      onTap: () {
                        _setSelectedSetType('W');
                        Navigator.pop(context);
                      },
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Text(
                        'F',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.redAccent,
                        ),
                      ),
                      title: const Text('Failure Set'),
                      onTap: () {
                        _setSelectedSetType('F');
                        Navigator.pop(context);
                      },
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    ListTile(
                      leading: const Text(
                        'D',
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      title: const Text('Drop Set'),
                      onTap: () {
                        _setSelectedSetType('D');
                        Navigator.pop(context);
                      },
                      trailing: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.question_mark),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        });
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
            Card(
              color: Theme.of(context).colorScheme.secondaryContainer,
              child: ListTile(
                contentPadding: const EdgeInsets.only(right: 10.0),

                leading: TextButton(
                  //*showcases type of set
                  onPressed: () {
                    _setDescription();
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(
                        Theme.of(context).colorScheme.secondaryContainer),
                  ),
                  child: const Text(
                    'SETS', // Default value or initial value
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                subtitle: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    //* TextButton for picking and showing Metric or Imperial system
                    TextButton(
                      onPressed: () {
                        _weightDescription();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondaryContainer),
                      ),
                      child: const Text(
                        'KGs',
                      ),
                    ),
                    //* TextButton for describing reps
                    TextButton(
                      onPressed: () {
                        _repDescription();
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                            Theme.of(context).colorScheme.secondaryContainer),
                      ),
                      child: const Text(
                        'REPS',
                      ),
                    ),
                  ],
                ),
                //* IconButton for showing checked or unchecked set
                trailing: IconButton(
                  onPressed: () {
                    _completionTickDescription();
                  },
                  icon: const Icon(Icons.check),
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
                    contentPadding: const EdgeInsets.only(right: 10.0),
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
                      width: 50,
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
