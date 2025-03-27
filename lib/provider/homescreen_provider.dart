import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notepad/hive/notes_model.dart';

class HomescreenProvider extends ChangeNotifier {
  bool isMultiSelection = false;
  HashSet<NotesModel> selectedItem = HashSet();
  late Box<NotesModel> notesBox;

  void setMultiSelection(bool value) {
    isMultiSelection = value;
    notifyListeners();
  }

  void toggleSelection(NotesModel noteModel){
    if (selectedItem.contains(noteModel)){
      selectedItem.remove(noteModel);
    } else {
      selectedItem.add(noteModel);
    }
    notifyListeners();
  }

  void clearSelection() {
    selectedItem.clear();
    setMultiSelection(false);
    notifyListeners();
  }

  void toggleSelectAll() {
    if (selectedItem.length == notesBox.length) {
      clearSelection();
    } else {
      selectedItem.addAll(notesBox.values.cast<NotesModel>());
      notifyListeners();
    }
  }

  String getSelectedItemCount() {
    return '${selectedItem.length}/${notesBox.length}';
  }

  setNotesBox(Box<NotesModel> box) {
    notesBox = box;
    notifyListeners();
  }

  void delete(NotesModel notesModel) async {
    await notesModel.delete();
    notifyListeners();
  }
}
