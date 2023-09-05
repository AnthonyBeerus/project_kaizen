import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/themes/colors.dart';

class FloatingAction extends StatefulWidget {
  final Color backgroundColor;
  final Color childIconColor;
  final AnimatedIconData animatedIcon;
  final List<SpeedDialChild> children;

  const FloatingAction({
    super.key,
    required this.backgroundColor,
    required this.childIconColor,
    required this.animatedIcon,
    required this.children,
  });

  @override
  State<FloatingAction> createState() => _FloatingActionState();
}

class _FloatingActionState extends State<FloatingAction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        backgroundColor: brandColor,
        overlayColor: Colors.black,
        overlayOpacity: 0.5,
        spacing: 1,
        spaceBetweenChildren: 10,
        animatedIcon: widget.animatedIcon,
        children: widget.children,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }
}
