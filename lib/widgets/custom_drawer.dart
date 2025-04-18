// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, unused_import

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/dark-mode-provider.dart';
import '../screens/settings-screen.dart';
import 'category_list.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 5),
                Row(
                  children: [
                    Text("Simple",
                        style: TextStyle(
                          fontSize: 25,
                        )),
                    Text("Notes",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        )),
                    Spacer(),
                    Consumer<DarkModeProvider>(
                        builder: (BuildContext context, value, child) {
                      return IconButton(
                          onPressed: () {
                            value.toggleDarkMode(value: !value.isDarkMode);
                          },
                          icon: Icon(
                              value.isDarkMode
                                  ? Icons.brightness_2_rounded
                                  : Icons.brightness_5_rounded,
                              size: 26));
                    }),
                    // Icon(Icons.dark_mode),
                  ],
                ),
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(
                    Icons.note_outlined,
                    size: 30,
                  ),
                  title: Text("Notes",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                SizedBox(height: 5),
                ListTile(
                  leading: const Icon(
                    Icons.delete_outline_rounded,
                    size: 30,
                  ),
                  title: Text("Trash",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Divider(),
                // CategoryList(),
                ListTile(
                  leading: const Icon(
                    Icons.work,
                    color: const Color.fromARGB(255, 243, 33, 226),
                    size: 30,
                  ),
                  title: Text("Work",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.person,
                    color: Colors.amber,
                    size: 30,
                  ),
                  title: Text("Personal",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.book,
                    color: Colors.blue,
                    size: 30,
                  ),
                  title: Text("Ideas",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                Divider(),
                // ListTile(
                //   leading: const Icon(
                //     Icons.category,
                //     size: 30,
                //   ),
                //   title: Text("Manage Categories",
                //       style: TextStyle(
                //         fontWeight: FontWeight.bold,
                //       )),
                // ),
                ListTile(
                  leading: const Icon(
                    Icons.backup,
                    size: 30,
                  ),
                  title: Text("Backup / Restore",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
                ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SettingsScreen()));
                  },
                  leading: const Icon(
                    Icons.settings,
                    size: 30,
                  ),
                  title: Text("Settings",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
