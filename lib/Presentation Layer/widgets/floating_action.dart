import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';

class CustomFloatingActionButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final String label;
  final VoidCallback onTap;
  final Icon icon;
  final SpeedDialChild speedDialChild;
  final List<SpeedDialChild> speedDialChildren;


  const CustomFloatingActionButton({
    super.key,
    required this.child,
    required this.onPressed,
    required this.label,
    required this.onTap,
    required this.icon,
    required this.speedDialChild,
    required this.speedDialChildren,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      width: 70,
      child: Container(
        margin: const EdgeInsets.only(
          right: 10,
          bottom: 10,
        ),
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
          animatedIconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.background),
          children: [
            SpeedDialChild(
              child: const Icon(Icons.add_circle),
              labelBackgroundColor: Theme.of(context).colorScheme.background,
              labelStyle: const TextStyle(
                fontFamily: "Roboto",
                fontSize: 18,
              ),
              label: label,
              backgroundColor: Theme.of(context).colorScheme.background,
              elevation: 10,
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
