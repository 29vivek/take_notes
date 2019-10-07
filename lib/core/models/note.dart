import 'package:cloud_firestore/cloud_firestore.dart';

class Note {
  String title;
  String body;
  final String userUid;
  final String docId;

  Note({this.title, this.body, this.userUid, this.docId});

  factory Note.fromMap(Map data) {
    return Note(
      title: data['title'] ?? '', 
      body: data['body'] ?? '',
      userUid: data['userUid'],
      docId: data['docId'] ?? '',
    );
  }

  Note.fromSnapshot(DocumentSnapshot snapshot):
    body = snapshot['body'],
    title = snapshot['title'],
    userUid = snapshot['userUid'],
    docId = snapshot['docId'];

  Map<String, dynamic> toMap() {
    return {'title':title, 'body': body, 'userUid':userUid, 'docId':docId};
  }
}
