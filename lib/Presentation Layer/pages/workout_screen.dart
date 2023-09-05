// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/Data/models/workout_data.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/routine.dart';
import 'package:phenom_fitness/themes/colors.dart';
import 'package:provider/provider.dart';

class WorkoutScreen extends StatefulWidget {
  const WorkoutScreen({super.key});

  @override
  State<WorkoutScreen> createState() => _WorkoutScreenState();
}

class _WorkoutScreenState extends State<WorkoutScreen> {
  final newWorkoutNameController = TextEditingController();
  //go to workout page
  void goToRoutinePage(String workoutName) {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Routine(workoutName: workoutName),
        ));
  }

  //Create new workout
  Future createNewWorkout(BuildContext context) {
    return showModalBottomSheet(
      barrierColor: Colors.black.withOpacity(0.6),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(30)
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      context: context,
      builder: (context) => Container(
        padding: const EdgeInsets.all(16),
        height: 500,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              "Create New Workout",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: "Roboto",
              ),
            ),
            TextField(
              controller: newWorkoutNameController,
              decoration: const InputDecoration(
                labelText: 'Routine Name',
              ),
            ),
            const SizedBox(height: 16), // Add some spacing
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end, // Align buttons to the bottom
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          saveWorkout();
                        },
                        child: const Text('Save'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          cancelWorkout();
                        },
                        child: const Text('Cancel'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void startEmptyWorkout() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return const SizedBox(
            height: 500,
            child: Text('New Workout'),
          );
        }
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
      statusBarColor: brandColor, // Set this to your AppBar color
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<WorkoutData>(
      builder: (context, value, child) => Scaffold(
        appBar: AppBar(
          leading: Icon(
            Icons.menu_outlined, 
            color: Theme.of(context).colorScheme.tertiary,
          ),
          backgroundColor: Theme.of(context).colorScheme.background,
          elevation: 0,
          title: Text(
            'G Y M',
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
        ),
        backgroundColor: Theme.of(context).colorScheme.background,
        body: ListView.builder(
          itemCount: value.getWorkoutList().length,
          itemBuilder: (context, index) => ListTile(
            title: Text(value.getWorkoutList()[index].name),
            trailing: IconButton(
                icon: const Icon(Icons.arrow_circle_right),
                onPressed: () =>
                    goToRoutinePage(value.getWorkoutList()[index].name)),
          ),
        ),
        floatingActionButton: SizedBox(
          height: 120,
          width: 120,
          
          child: Container(
          
            margin: const EdgeInsets.only(right: 10, bottom: 20),
            child: SpeedDial(
              label: const Text('Create'),
              foregroundColor: Theme.of(context).colorScheme.primary,
              animatedIcon: AnimatedIcons.add_event,
              backgroundColor: Theme.of(context).colorScheme.secondary,
              overlayColor: Theme.of(context).colorScheme.background,
              overlayOpacity: 0.9,
              elevation: 1,
              spaceBetweenChildren: 10,
              animatedIconTheme: IconThemeData(color: Theme.of(context).colorScheme.background),
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.add_chart_outlined),
                  labelBackgroundColor: Theme.of(context).colorScheme.background,
                  labelStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                  ),
                  label: ('Add New Routine'),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  elevation: 1,
                  onTap: () {
                    createNewWorkout(context);
                  }
                ),
                SpeedDialChild(
                  child: const Icon(Icons.hourglass_empty),
                  labelBackgroundColor: Theme.of(context).colorScheme.background,
                  label: ('Start Empty Workout'),
                  labelStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 15,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  elevation: 1,
                  onTap: startEmptyWorkout
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
