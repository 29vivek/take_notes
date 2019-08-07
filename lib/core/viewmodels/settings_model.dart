import 'package:flutter/material.dart';
import 'package:take_notes/core/enums/theme_states.dart';
import 'package:take_notes/core/services/theme_service.dart';
import 'package:take_notes/locator.dart';

class SettingsModel with ChangeNotifier {

  ThemeState _state;

  ThemeState get state => _state;

  ThemeService _themeService = locator<ThemeService>();

  void getSelectedTheme() {
    _state = _themeService.initialThemeState();
  }

  Future<void> changeTheme(ThemeState newTheme) async {
    await _themeService.changeTheme(newTheme);
    _state =  newTheme;
    notifyListeners();
  }

}