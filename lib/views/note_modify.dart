import 'package:flutter/material.dart';

class NoteModify extends StatelessWidget {
  final String noteID;
  bool get isEditing => noteID != null;

NoteModify({this.noteID});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? 'Edit Note' : 'Create Note'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(hintText: 'Note Title'),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              decoration: InputDecoration(hintText: 'Note Content'),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              child: RaisedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'Submit',
                  style: TextStyle(color: Colors.white),
                ),
                color: Theme.of(context).primaryColor,
              ),
            )
          ],
        ),
      ),
    );
  }
}
