import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/viewmodels/login_model.dart';
import 'package:take_notes/locator.dart';
import 'package:take_notes/ui/shared/text_styles.dart';
import 'package:take_notes/ui/widgets/login_button.dart';

class LoginView extends StatefulWidget {

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {

  LoginModel model = locator<LoginModel>();

  @override
  void initState() {
    super.initState();
    model.isLoggedIn().then((loggedIn) {
      if(loggedIn) 
        Navigator.pushReplacementNamed(context, '/home');
    });
  }

  @override
  Widget build(BuildContext context) {
    // System Chrome specifies the set of system overlays to have visible when the application is running.
    
    return ChangeNotifierProvider<LoginModel>(
      builder: (context) => model,
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(), // emptyAppBar
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Spacer(flex: 3),
              Text('Take Notes', style: boldText, textAlign: TextAlign.center,),
              Text('Your Personal Dairy. Sign In to Continue.', style: normalText, overflow: TextOverflow.visible, textAlign: TextAlign.center,),
              Spacer(flex: 1),
              Padding(padding: EdgeInsets.all(20.0), child: LoginButton()),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}