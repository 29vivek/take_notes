import 'package:flutter/material.dart';
import 'package:take_notes/core/services/theme_service.dart';
import 'package:take_notes/locator.dart';
import 'package:take_notes/ui/router.dart';
import 'package:provider/provider.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:take_notes/core/services/authentication_service.dart';

Future<void> main(List<String> args) async {
  try {
    await setupLocator();
    runApp(MyApp());
  } catch(error) {
    print('locator setup has failed.');
    print(error);
  }
}

class MyApp extends StatelessWidget {
  @override 
  Widget build(BuildContext context) {

    ThemeService service = locator<ThemeService>();

    return MultiProvider(
      providers: [
        StreamProvider<FirebaseUser>(builder: (context) => locator<AuthenticationService>().user),
        StreamProvider<ThemeData>(builder: (context) => service.theme,
          initialData: service.initialTheme()),
      ],
      
      child: Consumer<ThemeData>(
        builder: (context, theme, child) => MaterialApp(
          title: 'Take Notes',
          theme: theme,
          initialRoute: '/',
          onGenerateRoute: Router.generateRoute,
        ),
      ),
    );
  }
}