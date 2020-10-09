import 'package:flutter/material.dart';

import 'views.dart/notes_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API Test',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: NotesList()
    );
  }
}


