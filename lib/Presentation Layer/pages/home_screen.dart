// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: CustomScrollView(
        slivers: [ 
          //Sliver App Bar
          SliverAppBar(
            leading: const Icon(
              Icons.menu,
              color: Colors.black,),
            backgroundColor: Theme.of(context).colorScheme.background,
            pinned: true,

            expandedHeight: 250,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                color: Theme.of(context).colorScheme.background,
              ),
            title: Text(
              'H E L L O',
              style: TextStyle(
                color: Theme.of(context).colorScheme.tertiary, 
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
                color: Colors.black,
              ),  
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                color: Colors.black,
              ),  
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                height: 400,
                color: Colors.black,
              ),  
            ),
          ),

        ],
      ),
    );
  }
}