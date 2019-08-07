import 'package:flutter/material.dart';
import 'package:take_notes/ui/shared/text_styles.dart';

class RadioTile<T> extends StatelessWidget {

  final String text;
  final T value;
  final T groupValue;
  final void Function(T) onChanged;

  const RadioTile({Key key, this.text, this.value, this.groupValue, this.onChanged}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Row(
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(text, style: normalText),
              ),
              Spacer(),
              Radio<T>(
                value: value,
                groupValue: groupValue,
                onChanged: onChanged,
                activeColor: Theme.of(context).accentColor,
              ),
            ],
          ),
          Divider(height: 2.0),
        ],
      ),
      onTap: () {
        // call the model.changeTheme with the current tile's value like so
        onChanged(value);
      }
    );
  }
}