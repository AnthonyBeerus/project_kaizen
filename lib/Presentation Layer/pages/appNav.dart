// ignore_for_file: use_full_hex_values_for_flutter_colors


import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/workout_screen.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/home_screen.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/message_screen.dart';
import 'package:phenom_fitness/Presentation%20Layer/pages/settings_screen.dart';
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
      backgroundColor: Theme.of(context).colorScheme.background,
      bottomNavigationBar: DotNavigationBar(
        margin: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 300),
        borderRadius: 10,
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
        splashBorderRadius: 20,
        currentIndex: _selectedIndex,
        onTap: _navigateBottomBar,
        backgroundColor:Theme.of(context).colorScheme.background,
        items: [
          DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Theme.of(context).colorScheme.secondary,
          ),
          DotNavigationBarItem(
              icon: const Icon(Icons.fitness_center),
              selectedColor: Theme.of(context).colorScheme.secondary,
          ),
          DotNavigationBarItem(
              icon: const Icon(Icons.chat_bubble),
              selectedColor: Theme.of(context).colorScheme.secondary,
          ),
          DotNavigationBarItem(
              icon: const Icon(Icons.auto_graph_outlined),
              selectedColor: Theme.of(context).colorScheme.secondary,
          ),
        ],
      ),
    );  
  }
}
