// ignore_for_file: non_constant_identifier_names

import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../constant.dart';
import 'dark-mode.dart';
import 'notes_model.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>(Constants.notesBox);

  static Box<DarkMode> getMode() => Hive.box<DarkMode>(Constants.darkModeBox);
}
