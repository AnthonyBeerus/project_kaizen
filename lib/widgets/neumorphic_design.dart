import 'package:flutter/material.dart';

class NeumorphicDesign extends StatelessWidget {
  final child;
  const NeumorphicDesign({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenWidth * 0.02),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(screenWidth * 0.06),
        color: Colors.grey.shade900,
        boxShadow: [
          //bottom right corner is darker
          BoxShadow(
            color: const Color(0XFFFD6AE7B),
            blurRadius: screenWidth * 0.04,
            offset: const Offset(4, 4),
            spreadRadius: 1,
          ),
          //top left corner is lighter
          BoxShadow(
            color: const Color(0xFFFD6AE7B),
            blurRadius: screenWidth * 0.04,
            offset: const Offset(-4, -4),
            spreadRadius: 1,
          ),
        ],
        gradient: const LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xfffeacda3),
            Color(0xFFFD6AE7B),
          ],
          stops: [
            0.1,
            0.9,
          ],
        ),
      ),
      child: Center(child: child),
    );
  }
}
