import 'dart:async';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';
import 'package:flutter/material.dart';
import 'package:take_notes/core/enums/theme_states.dart';
import 'package:take_notes/core/services/localstorage_service.dart';
import 'package:take_notes/locator.dart';
import 'package:take_notes/ui/shared/app_themes.dart';

class ThemeService {

  StreamController<ThemeData> _controller = StreamController<ThemeData>();

  LocalStorageService _storageService = locator<LocalStorageService>();

  Stream<ThemeData> get theme => _controller.stream;

  ThemeData initialTheme() {
    ThemeData themeToApply = getThemeFor(initialThemeState());
    updateStatusBarColor(themeToApply);
    return themeToApply;
  }

  ThemeState initialThemeState() {
    int themeIndex = _storageService.getTheme;
    return ThemeState.values.elementAt(themeIndex);
  }

  Future<void> updateStatusBarColor(ThemeData themeToApply) async {
    await FlutterStatusbarcolor.setStatusBarColor(themeToApply.scaffoldBackgroundColor);
    await FlutterStatusbarcolor.setNavigationBarColor(themeToApply.scaffoldBackgroundColor);
    if(useWhiteForeground(themeToApply.scaffoldBackgroundColor)) {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(true);
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    }
    else {
      FlutterStatusbarcolor.setStatusBarWhiteForeground(false);
      FlutterStatusbarcolor.setNavigationBarWhiteForeground(true);
    }
  }

  ThemeData getThemeFor(ThemeState themeState) {
    switch(themeState) {
      case ThemeState.Blue:
        return blueTheme;
      case ThemeState.Black:
        return blackTheme;
      case ThemeState.Dark:
        return darkTheme;
      case ThemeState.Lime:
        return limeTheme;
      case ThemeState.Fresh:
      default:
        return freshTheme;
    }
  }

  Future<void> changeTheme(ThemeState newTheme) async {
    ThemeData themeToApply = getThemeFor(newTheme);

    await updateStatusBarColor(themeToApply);
    _controller.add(themeToApply);
    
    _storageService.savedTheme = newTheme.index; 
  }

}
