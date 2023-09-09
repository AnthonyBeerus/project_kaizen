// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class MessageScreen extends StatefulWidget {
  const MessageScreen({super.key});

  @override
  State<MessageScreen> createState() => _MessageScreenState();
}

class _MessageScreenState extends State<MessageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Text(
          'Chat',
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: 50,
            fontWeight: FontWeight.bold,
            fontFamily: 'Roboto',
          ),
        ),
      ),
      floatingActionButton: GestureDetector(


        child: AnimatedContainer(
          duration: const Duration(seconds: 1),
          child: FloatingActionButton(
            onPressed: () {
            
            },
          ),
        ),
      ),
    );
  }
}