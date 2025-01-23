import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "S e t t i n g s",
          ),
          centerTitle: true,
        ),
        body: Center(
          child: Text("Settings page."),
        ),
      ),
    );
  }
}
