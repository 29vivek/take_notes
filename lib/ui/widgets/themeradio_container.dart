import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/enums/theme_states.dart';
import 'package:take_notes/core/viewmodels/settings_model.dart';
import 'package:take_notes/ui/shared/text_styles.dart';
import 'package:take_notes/ui/widgets/radio_tile.dart';

class ThemeRadioContainer extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingsModel>(
      builder: (BuildContext buildContext, SettingsModel model, Widget child) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0),
              child: Text('THEME', style: mediumText.copyWith(color: Theme.of(context).accentColor)),
            ),
            ...ThemeState.values.map((ThemeState theme) => RadioTile<ThemeState>(
              onChanged: model.changeTheme,
              groupValue: model.state,
              value: theme,
              text: theme.toString().split('.').last,
            )).toList(),
          ],
        );
      },

    );
  }
}