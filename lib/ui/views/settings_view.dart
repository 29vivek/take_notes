import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/viewmodels/settings_model.dart';
import 'package:take_notes/locator.dart';
import 'package:take_notes/ui/widgets/themeradio_container.dart';

class SettingsView extends StatefulWidget {

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {

  SettingsModel model = locator<SettingsModel>();

  @override
  void initState() {
    model.getSelectedTheme();
    super.initState();
  }

  @override
  Widget build(BuildContext context) => ChangeNotifierProvider<SettingsModel>.value(
    value: model,
    child: SafeArea(
      child: Scaffold(
        appBar: AppBar(title: Text('Settings'),),
        body: ListView(
          children: <Widget>[
            ThemeRadioContainer(),
          ],
        ),
      ),
    ),
  );
}