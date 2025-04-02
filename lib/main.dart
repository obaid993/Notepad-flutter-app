// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:notepad/screens/add_note.dart';
import 'package:provider/provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'hive/notes_model.dart';
import 'provider/addnotes_provider.dart';
import 'provider/homescreen_provider.dart';
import 'screens/home_screen.dart';
// import 'hive/notes_model.dart';
// import 'package:path_provider/path_provider.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  // AddNotesProvider.initHive;
  // var directory = await getApplicationDocumentsDirectory();
  // Hive.init(directory.path);
  // if (!Hive.isAdapterRegistered(0)) {
  //   Hive.registerAdapter(NotesModelAdapter());
  // }
  // await Hive.openBox<NotesModel>('notes');

  await AddNotesProvider.initHive();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomescreenProvider()),
        ChangeNotifierProvider(create: (_) => AddNotesProvider())
      ],
      // create: (context) => HomeScreenProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
          textButtonTheme: TextButtonThemeData(
            style: TextButton.styleFrom(
                // Change the text color to white
          ),
          ),
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.amber,
              // color: Colors.white
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
        ),
        home: HomeScreen(),
      ),
    );
  }
}