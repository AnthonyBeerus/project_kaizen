import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/themes/colors.dart';

class FloatingAction extends StatefulWidget {
  
  final Color background;
  final Color childIconColor;
  final List<SpeedDialChild> children;

  const FloatingAction({super.key, 
    required this.background,
    required this.childIconColor,
    required this.children,
  });

  @override
  State<FloatingAction> createState() => _FloatingActionState();
}

class _FloatingActionState extends State<FloatingAction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SpeedDial(
          backgroundColor: secondaryColor,
          animatedIcon: AnimatedIcons.view_list,
          overlayOpacity: 0.4,
          spacing: 10,
          spaceBetweenChildren: 10,
          children: widget.children,
        ),
      ),
    );
  }
}
