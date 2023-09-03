// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/Data/models/workout_data.dart';
import 'package:phenom_fitness/themes/colors.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final newWorkoutNameController = TextEditingController();
  //Create new workout
  void createNewWorkout() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Create New Routine"),
        content: TextField(
          controller: newWorkoutNameController,
        ),
        actions: [
          //save button
          MaterialButton(
            onPressed: saveWorkout,
            child: const Text('Save'),
          ),
          //cancel button
          MaterialButton(
            onPressed: cancelWorkout,
            child: const Text('Cancel'),
          ),
        ],
      ),
    );
  }

  //Save Workout
  void saveWorkout() {
    //get workout name from text controller
    String newWorkoutName = newWorkoutNameController.text;
    //add workout to workoutdata list
    Provider.of<WorkoutData>(context, listen: false).addWorkout(newWorkoutName);
    // remove dialog box after saving
    Navigator.pop(context);
    clear();
  }

  //Cancel Workout
  void cancelWorkout() {
    // remove dialog box after canceling
    Navigator.pop(context);
    clear();
  }
  //clear the controllers
  void clear() {
    newWorkoutNameController.clear();
  }

  @override
  void initState() {
    super.initState();

    // Set the status bar color to match the AppBar color
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: thirdColor, // Set this to your AppBar color
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          backgroundColor: secondaryColor,
          elevation: 0,
          title: Text(
            'G Y M',
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: secondaryColor,
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 100,
          width: 100,
          child: Container(
            margin: const EdgeInsets.only(right: 10, bottom: 20),
            child: SpeedDial(
              label: const Text('Create'),
              foregroundColor: Colors.black,
              animatedIcon: AnimatedIcons.menu_close,
              backgroundColor: thirdColor,
              overlayColor: secondaryColor,
              overlayOpacity: 0.8,
              elevation: 1,
              spaceBetweenChildren: 12,
              animatedIconTheme: const IconThemeData(color: Colors.black),
              children: [
                SpeedDialChild(
                    child: const Icon(Icons.add_chart_outlined),
                    label: ('Add New Routine'),
                    backgroundColor: thirdColor,
                    elevation: 1,
                    onTap: createNewWorkout),
                SpeedDialChild(
                  child: const Icon(Icons.hourglass_empty),
                  label: ('Start Empty Workout'),
                  backgroundColor: thirdColor,
                  elevation: 1,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
