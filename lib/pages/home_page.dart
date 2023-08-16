// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phenom_fitness/pages/workout.dart';
import 'package:phenom_fitness/pages/home.dart';
import 'package:phenom_fitness/pages/message.dart';
import 'package:phenom_fitness/pages/settings.dart';
import 'package:phenom_fitness/themes/colors.dart';
//import 'package:phenom_fitness/widgets/neumorphic_design.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const Workout(),
    const Settings()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: primaryColor,
        color: secondaryColor,
        onTap: _navigateBottomBar,
        animationDuration: const Duration(milliseconds: 200),
        index: _selectedIndex,
        height: 60,
        items: [
          Icon(Icons.home, color: primaryColor,),
          Icon(Icons.fitness_center, color: primaryColor),
          Icon(Icons.person, color: primaryColor),
        ],
      ),
    );
  }
}
