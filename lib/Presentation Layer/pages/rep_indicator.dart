import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:phenom_fitness/Presentation%20Layer/widgets/floating_action.dart';

class RepIndicatorUI extends StatefulWidget {
  const RepIndicatorUI({super.key});

  @override
  State<RepIndicatorUI> createState() => _RepIndicatorState();
}

class _RepIndicatorState extends State<RepIndicatorUI> {
  double boxHeight = 80;
  double boxWidth = 200;
  double boxX = 0;
  double boxY = 1;

  //* Function for expanding Box
  void _expandBox() {
    setState(() {
      boxHeight = 100;
      boxWidth = 400;
      boxX = 0;
      boxY = -1;
    });
  }

  //* Function for reverting Box
  void _revertBox() {
    setState(() {
      boxHeight = 80;
      boxWidth = 200;
      boxX = 0;
      boxY = 1;
    });
  }
  //TODO Create a Function for starting RepIndicator animation(concentric)

  //TODO Create a function to pause the RepIndicator animation(isometric)

  //TODO Create a function to resume the RepIndicator animation(eccentic)

  //TODO Create a function to reset the RepIndicator animation(end of rep)
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _expandBox,
      onDoubleTap: _revertBox,
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          elevation: 0,
          leading: const Icon(Icons.menu),
          title: Text(
            'R E P  I N D I C A T O R',
            style: TextStyle(
              color: Theme.of(context).colorScheme.tertiary,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontFamily: 'Roboto',
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.background,
        ),
        body: Container(
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomRight: Radius.zero,
              bottomLeft: Radius.elliptical(10, 10),
            ),
          ),
          child: AnimatedContainer(
            alignment: Alignment(boxX, boxY),
            duration: const Duration(milliseconds: 1000),
            curve: Curves.easeInOut,
            child: AnimatedContainer(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.zero,
                  bottomLeft: Radius.zero,
                ),
                color: Theme.of(context).colorScheme.secondary,
              ),
              curve: Curves.easeInOutQuad,
              duration: const Duration(milliseconds: 1000),
              height: boxHeight,
              width: boxWidth,
              child: Center(
                child: Text(
                  'R E P',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.background,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Roboto',
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          
        ),
        
        
      ),
    );
  }
}
