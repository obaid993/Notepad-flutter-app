// ignore_for_file: unused_import, prefer_const_constructors, prefer_final_fields, unnecessary_string_interpolations, unnecessary_import, deprecated_member_use
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../hive/boxes.dart';
import '../hive/notes_model.dart';
import '../provider/homescreen_provider.dart';
import '../widgets/addNote_btn.dart';
import '../widgets/custom_drawer.dart';
import '../widgets/empty_home_screen.dart';
import '../widgets/home_btm_nav.dart';
import 'add_note.dart';
import 'reading_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  Map<String, Color> _categoryColor = {
    'Work': const Color.fromARGB(255, 243, 33, 226),
    'Personal': Colors.amber,
    'Ideas': Colors.blue,
  };

  late Box<NotesModel> notesBox;

  @override
  void initState() {
    super.initState();
    notesBox = Boxes.getData();
    //  Hive.box<NotesModel>('notes');
    Provider.of<HomescreenProvider>(context, listen: false)
        .setNotesBox(notesBox);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        var provider = Provider.of<HomescreenProvider>(context, listen: false);
        provider.clearSelection();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => HomeScreen(),
          ),
        );
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Consumer<HomescreenProvider>(builder: (context, note, _) {
            return Text(note.isMultiSelection
                ? note.getSelectedItemCount()
                : 'NoteBook');
          }),
          centerTitle: Provider.of<HomescreenProvider>(context).isMultiSelection
              ? false
              : true,
          leading:
              Consumer<HomescreenProvider>(builder: (context, provider, child) {
            if (provider.isMultiSelection) {
              return IconButton(
                onPressed: () {
                  provider.clearSelection();
                },
                icon: Icon(Icons.close, color: Colors.white),
              );
            } else {
              return IconButton(
                icon: Icon(
                  Icons.menu,
                  color: Colors.white,
                ),
                onPressed: () => Scaffold.of(context).openDrawer(),
              );
            }
          }),
          actions: [
            
            Consumer<HomescreenProvider>(
              builder: (context, provider, _) {
                return Visibility(
                    visible: provider.isMultiSelection,
                    child: IconButton(
                        onPressed: () {
                          provider.toggleSelectAll();
                        },
                        icon: Icon(
                          Icons.select_all,
                          color: provider.selectedItem.length ==
                                  provider.notesBox.length
                              ? Colors.black
                              : Colors.white,
                        )));
              },
            ),
          Consumer<HomescreenProvider>(
              builder: (context, provider, _) {
                return Visibility(
                    visible: !provider.isMultiSelection,
                    child: PopupMenuButton(
                      icon : Icon(Icons.sort_outlined,
                      color : Colors.white,
                      ),
                    itemBuilder: ((context)=>[
                      PopupMenuItem(
                      value: 1,
                      onTap : (){},
                      child: Text('By modified date')),
                    PopupMenuItem(
                      value : 2,
                      onTap : (){

                      },
                      child : Text("By created date"),

                    ),
                    PopupMenuItem(
                      value : 3,
                      onTap : (){},
                      child : Text("By title")
                  ),
                  ]
                  ),
                    ),
                  );
              },
            ),
          ],
        ),
        drawer: CustomDrawer(),
        body: ValueListenableBuilder<Box<NotesModel>>(
          valueListenable: Boxes.getData().listenable(),
          builder: (context, box, _) {
            var data = box.values.toList().cast<NotesModel>();
            return data.isEmpty
                ? EmptyHomeScreen()
                : ListView.builder(
                    itemCount: box.length,
                    itemBuilder: (context, index) {
                      var provider = Provider.of<HomescreenProvider>(context,listen: false);
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5),
                        child: InkWell(
                          onTap: () {
                            provider.isMultiSelection
                                ? provider.toggleSelection(data[index])
                                : Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ReadingScreen(
                                              noteModel: data[index],
                                            )));
                          },
                          onLongPress: () {
                            if (!provider.isMultiSelection) {
                              provider.setMultiSelection(true);
                            }
                            provider.toggleSelection(data[index]);
                          },
                          child: Stack(
                            alignment: Alignment.centerRight,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Flexible(
                                        child: Text(
                                          data[index].notes.toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        data[index].category != null
                                            ? '${data[index].category!}'
                                            : '',
                                        style: TextStyle(
                                            color: _categoryColor[
                                                data[index].category ?? '']),
                                      ),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        data[index].date != null
                                            ? '${DateFormat.yMd().format(data[index].date!)}'
                                            : '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Consumer<HomescreenProvider>(
                                builder: (context, provider, _) {
                                  return Visibility(
                                    visible: provider.isMultiSelection,
                                    child: Icon(
                                      provider.selectedItem
                                              .contains(data[index])
                                          ? Icons.check_circle
                                          : Icons.radio_button_unchecked,
                                      size: 20,
                                      color: Colors.amber,
                                    ),
                                  );
                                },
                              )
                            ],
                          ),
                        ),
                      );
                    });
          },
        ),
        floatingActionButton: AddNoteBtn(),
        bottomNavigationBar: HomeBottomNavigation(),
      ),
    );
  }
}
