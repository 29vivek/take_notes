import 'package:flutter/material.dart';
import 'package:take_notes/core/models/note.dart';
import 'package:take_notes/ui/views/home_view.dart';
import 'package:take_notes/ui/views/login_view.dart';
import 'package:take_notes/ui/views/note_view.dart';
import 'package:take_notes/ui/views/settings_view.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch(settings.name) {
      case '/home':
        return MaterialPageRoute(builder: (_) => HomeView());
      case '/':
        return MaterialPageRoute(builder: (_) => LoginView());
      case '/settings':
        return MaterialPageRoute(builder: (_) => SettingsView());
      case '/note':
        var note = settings.arguments as Note;
        return MaterialPageRoute(builder: (_) => NoteView(note: note));
      default:
        return MaterialPageRoute(builder: (_) => Scaffold(
          body: Center(child: Text('No route defined for name ${settings.name}'),),
        ));
    }
  }
}