// ignore_for_file: file_names, prefer_final_fields

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../hive/boxes.dart';
import '../hive/dark-mode.dart';

class DarkModeProvider extends ChangeNotifier {
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  void getSavedMode() {
    final darkModeBox = Boxes.getMode();

    if (darkModeBox.isNotEmpty) {
      final darkMode = darkModeBox.getAt(0);
      _isDarkMode = darkMode!.isDarkTheme;
    }
  }

  void toggleDarkMode({
    required bool value,
    DarkMode? darkMode,
  }) {
    if (darkMode != null) {
      darkMode.isDarkTheme = value;
      darkMode.save();
    } else {
      final darkBox = Boxes.getMode();
      darkBox.put(0, DarkMode(isDarkTheme: value));
    }
    _isDarkMode = value;
    notifyListeners();
  }
}

