// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget ThemeExpansionTile() {
  return ExpansionTile(
    title: Text("Select Theme"),
    leading: const Icon(
      Icons.mode,
    ),
    children: [
      ListTile(
        leading: const Icon(Icons.light_mode, color: Colors.white),
        title: const Text("Light Mode", style: TextStyle(color: Colors.white)),
        onTap: () {},
      ),
      ListTile(
        leading: const Icon(Icons.mode_night),
        title: const Text("Dark Mode"),
        onTap: () {},
      )
    ],
  );
}

Widget TextSizeExpansionTile() {
  return ExpansionTile(title: Text("Text size"),
  children: [
    Text("Small"),
    Text("Medium"),
    Text("Large"),
  ],
  );
}

Widget CursorStartEditor() {
  return ExpansionTile(title: Text("Cursor start on editor"),
  children: [
    Text("Title"),
    Text("Content"),
  ],
  );
}


