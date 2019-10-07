import 'package:flutter/material.dart';
import 'package:take_notes/core/models/note.dart';
import 'package:take_notes/core/services/firestore_service.dart';
import 'package:take_notes/locator.dart';

class NoteView extends StatefulWidget {
  final Note note;

  const NoteView({Key key, this.note}) : super(key: key);

  @override
  _NoteViewState createState() => _NoteViewState();
}

class _NoteViewState extends State<NoteView> {

  TextEditingController titleController = TextEditingController();
  TextEditingController bodyController = TextEditingController();

  @override
  void initState() {
    bool isNoteOpened = widget.note != null;
    titleController.text = isNoteOpened ? widget.note.title : '';
    bodyController.text = isNoteOpened ? widget.note.body : '';
    super.initState();
  }

  Future<bool> _willPopScope() async {
    if(widget.note == null) {
      if(titleController.value.text != '' || bodyController.value.text != '') {
        FirestoreService firestoreRef = locator<FirestoreService>();
        firestoreRef.addDoc(titleController.value.text, bodyController.value.text);
      }
    }
    else if(widget.note.title != titleController.value.text || widget.note.body != bodyController.value.text) {
      widget.note.title = titleController.value.text;
      widget.note.body = bodyController.value.text;
      FirestoreService firestoreRef = locator<FirestoreService>();
      firestoreRef.updateData(widget.note);
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _willPopScope,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.add_alert),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  if(widget.note != null) {
                    FirestoreService firestoreRef = locator<FirestoreService>();
                    firestoreRef.deleteNote(widget.note);
                    Navigator.pop(context);
                  }
                  
                },
              ),
            ],
          ),
          body: LayoutBuilder(
            builder: (ctxt, constraints) => SingleChildScrollView(
              padding: EdgeInsets.all(16.0),
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight, minWidth: constraints.maxWidth),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration.collapsed(hintText: 'Title'),
                      controller: titleController,
                      style: Theme.of(context).textTheme.headline,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                    ),
                    SizedBox(height: 10.0),
                    Flexible(
                      fit:FlexFit.loose,
                      child: TextField(
                        autofocus: true,
                        decoration: InputDecoration.collapsed(hintText: 'Body'),
                        controller: bodyController,
                        style: Theme.of(context).textTheme.subhead,
                        keyboardType: TextInputType.multiline,
                        maxLines: null,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    
    titleController.dispose();
    bodyController.dispose();
    super.dispose();
  }
}