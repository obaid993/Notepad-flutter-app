// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../screens/add_note.dart';

class EmptyHomeScreen extends StatelessWidget {
  const EmptyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> AddNote()));
        },
        child: Container(
          // color : Colors.white,
          // decoration: BoxDecoration(
          //   color: const Color.fromARGB(255, 228, 219, 219),
          //   // color: Theme.of(context).cardColor,
          //   borderRadius: BorderRadius.circular(8),
          // ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                Icons.description_outlined,
                size: 40,
                color: Colors.grey,
              ),
              const SizedBox(
                height: 15,
              ),
              Text("Add Notes",
                  style: const TextStyle(
                      // fontFamily : semibold,
                      color: Colors.grey,
                      fontSize: 14))
            ],
          ),
        ),
      ),
    );
  }
}
