// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:phenom_fitness/themes/colors.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';


class Message extends StatefulWidget {
  const Message({super.key});

  @override
  State<Message> createState() => _MessageState();
}

class _MessageState extends State<Message> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: secondaryColor,
        animatedIcon: AnimatedIcons.view_list,
        overlayOpacity: 0.4,
        children: [
          SpeedDialChild(
            backgroundColor: thirdColor,
            child: const Icon(Icons.help)
          ),
        ],
      ),
      backgroundColor: primaryColor,
      body: Center(
        child: Text(
          'Chat',
          style: TextStyle(
            color: secondaryColor,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
    );
  }
}