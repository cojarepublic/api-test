import 'dart:developer';

import 'package:api_test/models/api_response.dart';
import 'package:api_test/models/note_for_listing.dart';
import 'package:api_test/services/notes_service.dart';
import 'package:api_test/views/note_modify.dart';
import 'package:api_test/views/note_delete.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'note_modify.dart';

class NotesList extends StatefulWidget {

  @override
  _NotesListState createState() => _NotesListState();
}

class _NotesListState extends State<NotesList> {
  NotesService get service => GetIt.I<NotesService>();

  APIResponse<List<NoteForListing>> _apiResponse;
  bool _isLoading = false;

  String formatDateTime(DateTime dateTime) {
    return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
  }

  @override
  void initState() {
    _fetchNotes();
    super.initState();
  }

  _fetchNotes() async {
    setState(() {
      _isLoading = true;
    });

    _apiResponse = await service.getNotesList();


    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of Notes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => NoteModify(),
          ));
        },
        child: Icon(Icons.add),
      ),
      body: Builder(
        builder: (_) {
          if (_isLoading) {
            return CircularProgressIndicator();
          }

          if (_apiResponse.error) {
            return Center(child: Text(_apiResponse.errorMessage));
          }
          return ListView.separated(
        separatorBuilder: (context, index) => Divider(
          height: 1,
          color: Colors.green,
        ),
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(_apiResponse.data[index].noteID),
            direction: DismissDirection.startToEnd,
            onDismissed: (direction) {

            },
            confirmDismiss: (direction) async {
              final result = await showDialog(context: context,
              builder: (context) => NoteDelete());
              print(result);
              return result;
            },
            background: Container(
              color: Colors.red,
              padding: EdgeInsets.only(left: 16),
              child: Align(child: Icon(Icons.delete_forever, color: Colors.white,), alignment: Alignment.centerLeft,),

            ),
                      child: ListTile(
              title: Text(_apiResponse.data[index].noteTitle),
              subtitle: Text(
                  'Last edited on ${formatDateTime(_apiResponse.data[index].latestEditDateTime)}'),
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => NoteModify(
                    noteID: _apiResponse.data[index].noteID,
                  ),
                ));
              },
            ),
          );
        },
        itemCount: _apiResponse.data.length,
      );
        }
        )
    );
  }
}
