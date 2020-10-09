import 'package:api_test/models/note_for_listing.dart';
import 'package:flutter/material.dart';

class NotesList extends StatelessWidget {

final List notes = [
  NoteForListing(
    noteID: '1',
    createDateTime: DateTime.now(),
    lastEditDateTime: DateTime.now(),
    noteTitle: 'Note 1',
  ),
  NoteForListing(
    noteID: '2',
    createDateTime: DateTime.now(),
    lastEditDateTime: DateTime.now(),
    noteTitle: 'Note 2',
  ),
  NoteForListing(
    noteID: '3',
    createDateTime: DateTime.now(),
    lastEditDateTime: DateTime.now(),
    noteTitle: 'Note 3',
  ),
];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
      body: ListView.separated(
        separatorBuilder: (context, index) => Divider(height: 1, color: Colors.green,),
        itemBuilder: (context, index) {
          return ListTile(
            title: Text('Hello'),
            subtitle: Text('Last edited on 9/10/2020'),
          );
        } ,
        itemCount: 30,
      ),
    );
  }
}
