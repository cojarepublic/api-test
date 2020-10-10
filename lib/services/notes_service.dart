import 'dart:convert';

import 'package:api_test/models/api_response.dart';
import 'package:api_test/models/note_for_listing.dart';
import 'package:http/http.dart' as http;

class NotesService {

      static const API = 'http://api.notes.programmingaddict.com';
      static const headers = {
        'apiKey': '123456789'
      };

  Future<APIResponse<List<NoteForListing>>> getNotesList() async{
        return await http.get(API + '/notes', headers: headers)
        .then((data) {
          if (data.statusCode == 200) {
          final jsonData = json.decode(data.body);
          final notes = <NoteForListing>[];
          for (var item in jsonData) {
            final note = NoteForListing(
              noteID: item['noteID'],
              noteTitle: item["noteTitle"],
              createDateTime: DateTime.parse(item['createDateTime']),
              latestEditDateTime: item['latestEditDateTime'] != null ? DateTime.parse(item['latestEditDateTime']) : DateTime.parse(item['createDateTime']),
            );
            notes.add(note);
          }
          return APIResponse<List<NoteForListing>> (data: notes);
        }
        return APIResponse<List<NoteForListing>> (error: true, errorMessage: 'an error occured');
        }).catchError((_) => APIResponse<List<NoteForListing>> (error: true, errorMessage: 'an error occured'));
        
}
  }