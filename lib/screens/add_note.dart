// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:notepad/provider/addnotes_provider.dart';
import 'package:provider/provider.dart';

import '../hive/notes_model.dart';

class AddNote extends StatefulWidget {
  NotesModel? noteModel;
  String? note;
  bool? editMode;

  AddNote({this.noteModel, this.editMode = false});

  @override
  State<AddNote> createState() => _AddNoteState();
}

class _AddNoteState extends State<AddNote> {
  @override
  void initState() {
    super.initState();
    Provider.of<AddNotesProvider>(context, listen: false).noteController;
    Provider.of<AddNotesProvider>(context, listen: false).focusNode;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<AddNotesProvider>(
      builder: (context, provider, _) {
        return Scaffold(
          appBar: AppBar(
              automaticallyImplyLeading: false,
              title: Row(
                children: [
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text('Cancel')),
                  Spacer(),
                  TextButton(
                      onPressed: () {
                        provider.editMode
                            ? provider.updateNote()
                            : provider.saveNote();
                        Navigator.pop(context, provider.notesModel);
                      },
                      child: Text('Save')),
                ],
              )),
          body: SafeArea(
            child: ListView(
              children: [
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    // focusNode: provider.focusNode,
                    controller: provider.titleController,
                    decoration: InputDecoration(
                        hintText: 'Type Title', border: InputBorder.none),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    // focusNode: provider.focusNode,
                    maxLines: null,
                    controller: provider.noteController,
                    decoration: InputDecoration(
                        hintText: 'Type Note', border: InputBorder.none),
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
              currentIndex: provider.selectedIndex,
              onTap: provider.setCurrentIndex,
              items: provider.categories.map((ctg) {
                return BottomNavigationBarItem(
                    icon: Icon(
                      provider.categoryIcon[ctg],
                      color: provider.categoryColor[ctg],
                    ),
                    label: ctg);
              }).toList()),
        );
      },
    );
  }
}
