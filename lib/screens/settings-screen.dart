// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import '../widgets/settings-widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Settings"),
        // enterTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("General",
                  style: TextStyle(color: Colors.amber, fontSize: 20)),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: 'Backup / Restore'),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: 'Restore (old version)'),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: 'Theme'),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: 'Text Size'),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: 'Cursor start on editor'),
              spb(),
              Divider(),
              spb(),
              Text("About",
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                  )),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: "Rate app"),
              // SizedBox(height: 15),
              spb(),
              settingsWidget(onTap: () {}, title: 'Like Us'),
              spb(),
              settingsWidget(onTap: () {}, title: 'Privacy policy'),
              // SizedBox(height: 15),

              spb(),
              settingsWidget(onTap: () {}, title: 'Privacy settings')
            ],
          ),
        ),
      ),
    );
  }

  // space between widgets
  Widget spb() {
    return SizedBox(height: 20);
  }
}
