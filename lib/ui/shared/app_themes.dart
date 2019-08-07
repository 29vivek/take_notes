import 'package:flutter/material.dart';
import 'package:take_notes/ui/shared/app_colors.dart';

ThemeData freshTheme = ThemeData(

  brightness: Brightness.light,
  iconTheme: IconThemeData(color: grey700),
  dividerColor: grey500,
  textTheme: Typography().black,
  primaryColorBrightness: Brightness.light,
  primaryIconTheme: IconThemeData(color: grey900),
  primaryTextTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.w400)),
  primaryColorLight: Colors.white,

  accentColor: blueAccent,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(blueAccent),
  
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    brightness: Brightness.light,
    color: backgroundColorFresh,
    
  ),
  scaffoldBackgroundColor: backgroundColorFresh,
  
  buttonColor: buttonColorBlue,
  buttonTheme: ButtonThemeData(
    highlightColor: backgroundColorFresh,
    splashColor: backgroundColorFresh,
    colorScheme: ColorScheme.dark(),
  ),
  
  indicatorColor: blueAccent.withOpacity(0.8),
  cursorColor: blueAccent,
  canvasColor: backgroundColorFresh,

  bottomAppBarTheme: BottomAppBarTheme(color: cardColorFresh, elevation: 8.0),
  cardColor: cardColorFresh,
);


ThemeData limeTheme = ThemeData(

  brightness: Brightness.light,
  iconTheme: IconThemeData(color: grey700),
  dividerColor: grey500,
  textTheme: Typography().black,
  primaryColorBrightness: Brightness.light,
  primaryIconTheme: IconThemeData(color: grey900),
  primaryTextTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.w400)),
  primaryColorLight: Colors.white,

  accentColor: accentColorLime,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(accentColorLime),

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: backgroundColorLime,
    brightness: Brightness.light, // for dark statusbar icons
  ),
  scaffoldBackgroundColor: backgroundColorLime,
  
  buttonColor: buttonColorLime,
  buttonTheme: ButtonThemeData(
    highlightColor: backgroundColorLime,
    splashColor: backgroundColorLime,
    colorScheme: ColorScheme.light(),
  ),

  indicatorColor: accentColorLime.withOpacity(0.8),
  cursorColor: accentColorLime,
  canvasColor: backgroundColorLime,

  bottomAppBarTheme: BottomAppBarTheme(color: cardColorLime, elevation: 8.0),
  cardColor: cardColorLime,
);

ThemeData darkTheme = ThemeData(

  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: grey300),
  dividerColor: grey700,
  textTheme: Typography().white,
  primaryColorBrightness: Brightness.dark,
  primaryIconTheme: IconThemeData(color: grey300),
  primaryTextTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.w400)),
  primaryColorDark: Colors.black,

  accentColor: accentColorDark,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(accentColorDark),

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: backgroundColorDark,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: backgroundColorDark,

  buttonColor: buttonColorDark,
  buttonTheme: ButtonThemeData(
    highlightColor: backgroundColorDark,
    splashColor: backgroundColorDark,
    colorScheme: ColorScheme.dark(),
  ),
  
  indicatorColor: accentColorDark.withOpacity(0.8),
  cursorColor: accentColorDark,
  canvasColor: backgroundColorDark,

  bottomAppBarTheme: BottomAppBarTheme(color: cardColorDark, elevation: 8.0),
  cardColor: cardColorDark,
);


ThemeData blackTheme = ThemeData(

  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: grey300),
  dividerColor: grey700,
  textTheme: Typography().white,
  primaryColorBrightness: Brightness.dark,
  primaryIconTheme: IconThemeData(color: grey300),
  primaryTextTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.w400)),
  primaryColorDark: Colors.black,

  accentColor: Colors.tealAccent,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(Colors.tealAccent),
  
  appBarTheme: AppBarTheme(
    elevation: 0.0,
    color: Colors.black,
    brightness: Brightness.dark,
  ),
  scaffoldBackgroundColor: Colors.black,
  buttonColor: buttonColorDark,
  buttonTheme: ButtonThemeData(
    highlightColor: Colors.black,
    splashColor: Colors.black,
    colorScheme: ColorScheme.dark(),
  ),
  indicatorColor: Colors.tealAccent.withOpacity(0.8),
  canvasColor: Colors.black,
  cursorColor: Colors.tealAccent,

  bottomAppBarTheme: BottomAppBarTheme(color: Colors.black, elevation: 8.0),
  cardColor: Colors.black,
);

ThemeData blueTheme = ThemeData(

  brightness: Brightness.dark,
  iconTheme: IconThemeData(color: iconColorBlue),
  dividerColor: dividerColorBlue,
  textTheme: Typography().white,
  primaryColorBrightness: Brightness.dark,
  primaryIconTheme: IconThemeData(color: blueAccent),
  primaryTextTheme: TextTheme(title: TextStyle(fontWeight: FontWeight.w400)),

  accentColor: blueAccent,
  accentColorBrightness: ThemeData.estimateBrightnessForColor(blueAccent),
  primaryColorDark: Colors.black,

  appBarTheme: AppBarTheme(
    elevation: 0.0,
    brightness: Brightness.dark,
    color: backgroundColorBlue,
  ),
  scaffoldBackgroundColor: backgroundColorBlue,
  
  buttonColor: buttonColorBlue,
  buttonTheme: ButtonThemeData(
    highlightColor: backgroundColorBlue,
    splashColor: backgroundColorBlue,
    colorScheme: ColorScheme.dark(),
  ),
  
  indicatorColor: blueAccent.withOpacity(0.8),
  cursorColor: blueAccent,
  canvasColor: backgroundColorBlue,

  bottomAppBarTheme: BottomAppBarTheme(color: cardColorBlue, elevation: 8.0),
  cardColor: cardColorBlue,
);