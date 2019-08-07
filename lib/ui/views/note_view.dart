import 'package:flutter/material.dart';
import 'package:take_notes/core/models/note.dart';

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

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.add_alert),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {},
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
    );
  }

  @override
  void dispose() {
    
    super.dispose();
  }
}