import 'package:hive_flutter/hive_flutter.dart';
import 'notes_model.dart';

class Boxes {
  static Box<NotesModel> getData() => Hive.box<NotesModel>('notes');
}
