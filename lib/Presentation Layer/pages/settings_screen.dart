// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/themes/colors.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: lightColor,
          elevation: 0,
          title: Text(
            'P R O F I L E',
            style: TextStyle(
              color: textColor,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
        ),
      backgroundColor: lightColor,
      body: const Column(
          children: [
            // Menu item 1
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Overview'),
            ),
            // Menu item 2
            ListTile(
              leading: Icon(Icons.directions_run),
              title: Text('Recent Activity'),
            ),
            // Menu item 3
            ListTile(
              leading: Icon(Icons.history),
              title: Text('History'),
            ),
            // Menu item 4
            ListTile(
              leading: Icon(Icons.fitness_center),
              title: Text('Goals'),
            ),
            // Menu item 5
            ListTile(
              leading: Icon(Icons.gamepad),
              title: Text('Play on Fun'),
            ),
          ],
        ),
      floatingActionButton: SizedBox(
        height: 60,
        width: 60,
        child: Container(
          margin: const EdgeInsets.only(right: 10, bottom: 20),
          child: SpeedDial(
            animatedIcon: AnimatedIcons.menu_close,
            backgroundColor: brandColor,
            overlayColor: lightColor,
            overlayOpacity: 0.6,
            elevation: 1,
            spaceBetweenChildren: 12,
            children: [
              SpeedDialChild(
                child: const Icon(Icons.add_chart_outlined),
                label: ('Add New Routine'),
                backgroundColor: brandColor,
                elevation: 1,
              ),
              SpeedDialChild(
                child: const Icon(Icons.hourglass_empty),
                label: ('Start Empty Workout'),
                backgroundColor: brandColor,
                elevation: 1,
              ),
            ],
          ),
        ),
      ),
    );
  }
}