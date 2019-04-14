import 'package:flutter/material.dart';
import 'package:flutternote/src/screens/notes/create_note_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: CreateNoteScreen(),
    );
  }
}


