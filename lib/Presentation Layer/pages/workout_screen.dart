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
  void createNewWorkout() {

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
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          backgroundColor: thirdColor,
          overlayColor: secondaryColor,
          overlayOpacity: 0.6,
          elevation: 1,
          spaceBetweenChildren: 12,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add_chart_outlined),
              label: ('Add New Routine'),
              backgroundColor: thirdColor,
              elevation: 1,
            ),
            SpeedDialChild(
              child: const Icon(Icons.hourglass_empty),
              label: ('Start Empty Workout'),
              backgroundColor: thirdColor,
              elevation: 1,
            ),
          ],
        ),
      ),
    );
  }
}
