// ignore_for_file: prefer_const_constructors, unused_import

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:notepad/screens/add_note.dart';
import 'package:provider/provider.dart';
// import 'package:hive_flutter/hive_flutter.dart';
import 'hive/notes_model.dart';
import 'provider/addnotes_provider.dart';
import 'provider/dark-mode-provider.dart';
import 'provider/homescreen_provider.dart';
import 'screens/home_screen.dart';
import 'themes/my_theme.dart';
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
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => HomescreenProvider()),
    ChangeNotifierProvider(create: (_) => AddNotesProvider()),
    ChangeNotifierProvider(create: (_) => DarkModeProvider())
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.

  @override
  void initState() {
    setTheme();
    super.initState();
  }

  void setTheme() {
    final darkProvider = context.read<DarkModeProvider>();
    darkProvider.getSavedMode();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Simple Notes',
      theme: context.watch<DarkModeProvider>().isDarkMode ? darkTheme : lightTheme,
      // ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      //   textButtonTheme: TextButtonThemeData(
      //     style: TextButton.styleFrom(
      //         // Change the text color to white
      //         ),
      //   ),
      //   appBarTheme: const AppBarTheme(
      //       backgroundColor: Colors.amber,
      //       // color: Colors.white
      //       titleTextStyle: TextStyle(
      //           color: Colors.white,
      //           fontSize: 18,
      //           fontWeight: FontWeight.bold)),
      // ),
      home: HomeScreen(),
    );
  }
}
