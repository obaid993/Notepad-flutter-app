// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

Widget settingsWidget({
  required VoidCallback onTap,
  required String title,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Text(title,
        style: TextStyle(
          fontSize: 20,
        )),
  );
}
