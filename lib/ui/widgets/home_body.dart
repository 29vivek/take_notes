import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/enums/notes_states.dart';
import 'package:take_notes/core/models/note.dart';
import 'package:take_notes/core/viewmodels/home_model.dart';
import 'package:take_notes/ui/widgets/note_tile.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<HomeModel>(
      builder: (cxt, model, child) {
        switch (model.state) {
          case NotesState.Fetching:
            return Center(child: CircularProgressIndicator(),);
          case NotesState.NoDataAvailable:
            return Center(child: Text('Add notes to view them anywhere!'),);
          case NotesState.DataFetched:
          default:
            return ListView(
              children: model.userNotes.map((Note note) => NoteTile(note: note)).toList(),
            );
        }
      },
    );
  }
}