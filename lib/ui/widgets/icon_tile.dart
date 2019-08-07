import 'package:flutter/material.dart';
import 'package:take_notes/ui/shared/text_styles.dart';

class IconTile extends StatelessWidget {

  final IconData icon;
  final String text;
  final void Function() onPress;

  const IconTile({Key key, this.icon, this.text, this.onPress}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(16.0),
            child:Icon(icon),
          ),
          Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(text, style: mediumText),
          ),
        ],
      ),
      onTap: onPress,
    );
  }
}