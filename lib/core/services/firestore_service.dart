import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:take_notes/core/models/note.dart';
import 'package:take_notes/core/services/authentication_service.dart';
import 'package:take_notes/locator.dart';

class FirestoreService {

  AuthenticationService _authenticationService = locator<AuthenticationService>();
  
  Firestore _firestore = Firestore.instance;
  StreamController<List<Note>> noteController = StreamController<List<Note>>();

  FirestoreService() {
    print('creating firestore service');

    _authenticationService.getUser.then((user) {
      if(user != null)
        _firestore
          .collection('notes')
          .where('userUid', isEqualTo: user.uid)
          .snapshots()
          .listen(_notesForUser);
    });
  }

  Stream<List<Note>> get notes => noteController.stream;

  void _notesForUser(QuerySnapshot snapshot) {
    noteController.add(_notesFromSnapshot(snapshot));
  }

  List<Note> _notesFromSnapshot(QuerySnapshot snapshot) {
    var notes = List<Note>();
    var documents = snapshot.documents;

    var hasDocuments = documents.length > 0;
    if(hasDocuments) {
      for (var document in documents) {
        notes.add(Note.fromMap(document.data));        
      }
    }
    return notes;
  }

  void updateData(Note note) {
    _firestore.collection('notes').document(note.docId).updateData({'title': note.title, 'body': note.body});
  }
  
  void addDoc(String title, String body) {
    _authenticationService.getUser.then((user) {
      DocumentReference ref = _firestore.collection('notes').document();
      Note note = Note(title: title, body: body, docId: ref.documentID, userUid: user.uid);
      _firestore.collection('notes').document(ref.documentID).setData(note.toMap());
    });
    
  }

  Future<void> deleteNote(Note note) async {
    await _firestore.collection('notes').document(note.docId).delete();
  }
}