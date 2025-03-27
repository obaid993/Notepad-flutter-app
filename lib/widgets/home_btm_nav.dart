// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print

import 'package:flutter/material.dart';

class HomeBottomNavigation extends StatefulWidget {
  const HomeBottomNavigation({super.key});

  @override
  State<HomeBottomNavigation> createState() => _HomeBottomNavigationState();
}

class _HomeBottomNavigationState extends State<HomeBottomNavigation> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex, // Tracks the currently selected item
      onTap: (index) {
        // Handle the tap and update the current index
        _currentIndex = index;
        print('Selected Index: $index'); // Replace this with your actual logic
      },
      items: [ 
        BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined, size: 30), label: ''),
        BottomNavigationBarItem(
          icon: Icon(Icons.add, size: 30),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.star_outlined, size: 30),
          label: '',
        ),
      ],
    );
  }
}
