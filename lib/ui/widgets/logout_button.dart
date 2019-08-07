import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/viewmodels/logoutbutton_model.dart';
import 'package:take_notes/locator.dart';
import 'package:take_notes/ui/widgets/icon_tile.dart';

class LogoutButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider<LogoutButtonModel>.value(
      value: locator<LogoutButtonModel>(),
      child: Consumer<LogoutButtonModel>(
        builder: (BuildContext providedContext, LogoutButtonModel model,Widget child) {
          return IconTile(
            icon: Icons.exit_to_app,
            text: 'Log out',
            onPress: () async {
              await model.logout();

              // Navigator.of(context).pop();
              // To close only the drawer (closing the drawer this way rebuilds the scaffold)
              
              if(!model.isLoggedOut)
                Scaffold.of(context).showSnackBar(SnackBar(content: Text('Error Occurred!'),));
              else
                Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
                // this method takes care of closing drawer first, then scaffold.
            }
          ); 
        }
      ),
    );
  }
}