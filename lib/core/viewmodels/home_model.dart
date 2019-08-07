import 'package:flutter/material.dart';
import 'package:take_notes/core/enums/notes_states.dart';
import 'package:take_notes/core/models/note.dart';
import 'package:take_notes/core/services/firestore_service.dart';
import 'package:take_notes/locator.dart';

class HomeModel extends ChangeNotifier {

  NotesState _state = NotesState.NoDataAvailable;
  void _setState(NotesState newState) {
    _state = newState;
    notifyListeners();
  }
  NotesState get state => _state;

  List<Note> userNotes;
  final FirestoreService _firestoreService = locator<FirestoreService>();

  HomeModel() {
    _firestoreService.notes.listen(_onNotesUpdated);
  }

  void _onNotesUpdated(List<Note> notes) {
    userNotes = notes;
    if(userNotes == null) 
      _setState(NotesState.Fetching);
    else 
      _setState(userNotes.length == 0 
        ? NotesState.NoDataAvailable 
        : NotesState.DataFetched);
  }

  @override
  void dispose() {
    _firestoreService.noteController.close();
    print('closed.');
    super.dispose();
  }

}