// ignore_for_file: file_names, unused_import, unused_element, dead_code, unused_label, unnecessary_import, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../hive/notes_model.dart';
import '../provider/homescreen_provider.dart';
import '../screens/add_note.dart';

class AddNoteBtn extends StatefulWidget {
  const AddNoteBtn({super.key});

  @override
  State<AddNoteBtn> createState() => _AddNoteBtnState();
}

class _AddNoteBtnState extends State<AddNoteBtn> {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomescreenProvider>(
          builder: (context, provider, _) {
            return provider.isMultiSelection
                ? FloatingActionButton(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      provider.selectedItem.forEach((note) {
                        provider.delete(note);
                      });
                      provider.clearSelection();
                    },
                    child: Text('Delete'),
                  )
                : FloatingActionButton(
                    backgroundColor: Colors.amber,
                    foregroundColor: Colors.white,
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => AddNote()));
                    },
                    child: Icon(Icons.add),
                  );
            
          },
      
        );
         floatingActionButtonLocation:
            Provider.of<HomescreenProvider>(context).isMultiSelection
                ? FloatingActionButtonLocation.centerFloat
                : FloatingActionButtonLocation.endDocked;
  void delete(NotesModel notesModel) async {
    await notesModel.delete();
  }
  }
}