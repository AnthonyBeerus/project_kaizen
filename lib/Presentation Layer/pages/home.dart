// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';
import 'package:phenom_fitness/themes/colors.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: CustomScrollView(
        slivers: [

          //Sliver App Bar
          SliverAppBar(
            leading: Icon(Icons.menu, color: secondaryColor,),
            backgroundColor: thirdColor,
            pinned: true,

            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: backgroundColor,
              ),
            title: Text(
              'H E L L O',
              style: TextStyle(
                color: textColor, 
                fontFamily: 'Roboto',
                fontSize: 30, 
              ),
            ),
            ),
          ),
          //Sliver items
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                color: thirdColor,
              ),  
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                color: thirdColor,
              ),  
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                color: thirdColor,
              ),  
            ),
          ),

        ],
      ),
    );
  }
}