import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:take_notes/core/enums/login_states.dart';
import 'package:take_notes/core/viewmodels/login_model.dart';

class LoginButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Consumer<LoginModel>(
      builder: (context, model, child) => model.loginState == LoginState.Busy
      ? Center(child: CircularProgressIndicator()) 
      : SizedBox(
          width: double.infinity,
          height: 60.0,
          child: FlatButton.icon(
            color: Theme.of(context).buttonColor,
            
            icon: Icon(FontAwesomeIcons.google),
            label: Text('LOGIN WITH GOOGLE'),
            onPressed: () async {
              await model.loginWithGoogle();
              
              if(model.loginState == LoginState.Error)
                Scaffold.of(context).showSnackBar(SnackBar(content: Text(model.errorText),));
              if(model.loginState == LoginState.LoggedIn)
                Navigator.pushReplacementNamed(context, '/home');
            },
          ),
        ),
    );
  }
}