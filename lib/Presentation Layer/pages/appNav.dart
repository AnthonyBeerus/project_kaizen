// ignore_for_file: use_full_hex_values_for_flutter_colors


import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      bottomNavigationBar: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 6.0),
          child: GNav(
            duration: const Duration(milliseconds: 500),
            tabBorderRadius: 70,
            gap: 10,
            backgroundColor: secondaryColor,
            color: Colors.black,
            activeColor: Colors.white,
            onTabChange: _navigateBottomBar,
            tabBackgroundColor: Colors.black,
            tabs: const [
              GButton(
                icon: Icons.home,
              ),
              GButton(
                icon: Icons.fitness_center,
              ),
              GButton(
                icon: Icons.assistant_outlined,
              ),
              GButton(
                icon: Icons.person,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
