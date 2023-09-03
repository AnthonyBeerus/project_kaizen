// ignore_for_file: use_full_hex_values_for_flutter_colors


import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/workout_screen.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/home_screen.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/message_screen.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/settings_screen.dart';
import 'package:phenom_fitness/themes/colors.dart';
//import 'package:phenom_fitness/widgets/neumorphic_design.dart';

class AppNav extends StatefulWidget {
  const AppNav({super.key});

  @override
  State<AppNav> createState() => _AppNavState();
}

class _AppNavState extends State<AppNav> {
  int _selectedIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const WorkoutScreen(),
    const MessageScreen(),
    const SettingsScreen()
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: CurvedNavigationBar(
        height: 60,
        onTap: _navigateBottomBar,
        items: const [
          Icon(Icons.home,),
          Icon(Icons.fitness_center),
          Icon(Icons.message_outlined),
          Icon(Icons.person_2,),
        ],
        color: thirdColor,
        backgroundColor: secondaryColor,
        animationDuration: const Duration(milliseconds: 200),
      ),
    );  
  }
}
