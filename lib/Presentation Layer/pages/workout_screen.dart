// ignore_for_file: use_full_hex_values_for_flutter_colors
import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/Data/models/workout_data.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/routine.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

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
          itemBuilder: (context, index) => 
            SizedBox(
              height: 90,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Card(
                  elevation: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 0.0,vertical: 0.0),
                    child: Slidable(
                      startActionPane: ActionPane(
                        motion: const StretchMotion(), 
                        children: [
                          SlidableAction(
                            borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              bottomLeft: Radius.circular(10)
                            ),
                            onPressed: ((context){
                            }),
                            backgroundColor: Colors.amber,
                            icon: Icons.assistant,
                          ),
                          SlidableAction(
                            onPressed: ((context){
                            }),
                            backgroundColor:Colors.purpleAccent,
                            icon: Icons.analytics,
                          ),
                          SlidableAction(
                            onPressed: ((context){
                            }),
                            backgroundColor: Colors.lightBlue,
                            icon: Icons.share,
                          ),
                        ],  
                      ),
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(10),
                              bottomRight: Radius.circular(10)
                            ),
                            onPressed: ((context){

                            }),
                            backgroundColor: Colors.redAccent,
                            icon: Icons.delete,
                          ),
                        ],
                      ),
                      child: ListTile(
                        title: Text(
                          value
                          .getWorkoutList()[index].name
                        ),
                        trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () =>
                              goToRoutinePage(
                                value.getWorkoutList()[index].name
                              ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
        floatingActionButton: SizedBox(
          height: 70,
          width: 70,  
          child: Container(
            margin: const EdgeInsets.only(right: 10, bottom: 10,),
            decoration: BoxDecoration(
              boxShadow: [
                //bottom right shadow is darker
                BoxShadow(
                  color: Theme.of(context).colorScheme.primaryContainer,
                  offset: const Offset(4, 4),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
                //top left shadow is lighter
                BoxShadow(
                  color: Theme.of(context).colorScheme.secondaryContainer,
                  offset: const Offset(-4, -4),
                  blurRadius: 12,
                  spreadRadius: 1,
                ),
              ],
            ),
            child: SpeedDial(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              foregroundColor: Theme.of(context).colorScheme.secondary,
              animatedIcon: AnimatedIcons.add_event,
              backgroundColor: Theme.of(context).colorScheme.background,
              overlayColor: Theme.of(context).colorScheme.background,
              overlayOpacity: 0.9,
              elevation: 0,
              spaceBetweenChildren: 10,
              animatedIconTheme: IconThemeData(
                color: Theme.of(context).colorScheme.secondary
              ),
              children: [
                SpeedDialChild(
                  child: const Icon(Icons.add_chart_outlined),
                  labelBackgroundColor: Theme.of(context).colorScheme.background,
                  labelStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                  ),
                  label: ('Add New Routine'),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  elevation: 10,
                  onTap: () {
                    createNewWorkout(context);
                  }
                ),
                SpeedDialChild(
                  child: const Icon(
                    Icons.hourglass_empty, 
                  ),
                  labelBackgroundColor: Theme.of(context).colorScheme.background,
                  label: ('Start Empty Workout'),
                  labelStyle: const TextStyle(
                    fontFamily: "Roboto",
                    fontSize: 18,
                  ),
                  backgroundColor: Theme.of(context).colorScheme.background,
                  elevation: 10,
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
