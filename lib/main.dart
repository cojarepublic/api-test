import 'package:api_test/services/notes_service.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'views/notes_list.dart';


void setupLocator() {
GetIt.I.registerLazySingleton(() => NotesService());
}
void main() {
  setupLocator();
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


