// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:notepad/hive/boxes.dart';
import '../hive/notes_model.dart';

class AddNotesProvider extends ChangeNotifier {
  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  FocusNode focusNode = FocusNode();
  NotesModel? notesModel;
  bool editMode;

  AddNotesProvider({this.notesModel, this.editMode = false}) {
    noteController.text = notesModel?.notes ?? '';
    titleController.text = notesModel?.title ?? '';
    focusNode.requestFocus();
  }

  int selectedIndex = 0;
  List<String> categories = ['Work', 'Personal', 'Ideas'];

  Map<String, IconData> categoryIcon = {
    'Work': Icons.work,
    'Personal': Icons.person,
    'Ideas': Icons.book,
  };

  Map<String, Color> categoryColor = {
    'Work': const Color.fromARGB(255, 243, 33, 226),
    'Personal': Colors.amber,
    'Ideas': Colors.blue,
  };

  void setCurrentIndex(int index){
    selectedIndex = index;
    notifyListeners();
  }

  void updateNote() {
    if (editMode) {
      notesModel!.notes = noteController.text;
      notesModel!.category = categories[selectedIndex];
      notesModel!.title = titleController.text;
      notesModel!.save();
    }
  }

  void saveNote() {
    {
      final data = NotesModel(
        notes: noteController.text,
        title: titleController.text,
        date: DateTime.now(),
        category: categories.isNotEmpty ? categories[selectedIndex] : '',
      );
      final box = Boxes.getData();
      box.add(data);
      data.save();
    }
    noteController.clear();
    titleController.clear();
    notifyListeners();
  }

  //init Hive
  // static initHive() async {
  //   final dir = await path.getApplicationDocumentsDirectory();
  //   Hive.init(dir.path);
  //   await Hive.initFlutter('Notes.db');

  //   if (!Hive.isAdapterRegistered(0)) {
  //     Hive.registerAdapter(NotesModelAdapter());
  //     await Hive.openBox<NotesModel>('notes');
  //   }
  }

