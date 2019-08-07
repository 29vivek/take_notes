import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/ui/widgets/icon_tile.dart';
import 'package:take_notes/ui/widgets/logout_button.dart';

class HomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FirebaseUser user = Provider.of<FirebaseUser>(context, listen: false);
    // listen: false makes sure it does not rebuild when logged out. if not set,
    // Looking up a deactivated widget's ancestor is unsafe. error is thrown.
    
    return Drawer(
      child: Column(
        children: <Widget>[
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(backgroundImage: NetworkImage(user.photoUrl), radius: 40.0,),
                Text('${user.displayName}'),
                Text('${user.email}'),
              ],
            ),
          ),
          /// By default, [ListView] will automatically pad the list's scrollable
          /// extremities to avoid partial obstructions indicated by [MediaQuery]'s
          /// padding. To avoid this behavior, override with a zero [padding] property.
          Expanded(
            child: MediaQuery.removePadding(
              context: context,
              removeTop: true,
              child: ListView(
                children: <Widget>[
                  IconTile(
                    icon: Icons.settings,
                    text: 'Settings',
                    onPress: () => Navigator.of(context).pushNamed('/settings'),
                  ),
                  LogoutButton(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

}