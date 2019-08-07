import 'package:flutter/material.dart';
import 'package:take_notes/core/models/note.dart';

class NoteTile extends StatelessWidget {

  final Note note;

  const NoteTile({Key key, this.note}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
        padding: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: Theme.of(context).cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(note.title, maxLines: 1, overflow: TextOverflow.ellipsis, style: Theme.of(context).textTheme.subhead),
            SizedBox(height: 5.0,),
            Text(note.body, maxLines: 3, overflow:TextOverflow.ellipsis, style: Theme.of(context).textTheme.subhead.copyWith(fontSize: Theme.of(context).textTheme.subtitle.fontSize)),
          ],
        ),
      ),
      onTap: () {
        Navigator.pushNamed(context, '/note', arguments: note);
      }
    );
  }
}