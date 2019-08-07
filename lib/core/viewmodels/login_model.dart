import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:take_notes/core/enums/login_states.dart';
import 'package:take_notes/core/services/authentication_service.dart';
import 'package:take_notes/locator.dart';

class LoginModel extends ChangeNotifier {
  String errorText = '';
  
  Future<bool> isLoggedIn() async {
    FirebaseUser user = await _authenticationService.getUser;
    return user == null ? false : true;
  }

  LoginState _loginState = LoginState.Idle;
  LoginState get loginState => _loginState;

  void _setState(LoginState newState) {
    _loginState = newState;
    notifyListeners();
  }

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<void> loginWithGoogle() async {
    _setState(LoginState.Busy);
    
    bool loggedIn = await _authenticationService.loginWithGoogle();

    errorText = loggedIn ? '' : 'Error occurred';

    _setState(loggedIn ? LoginState.LoggedIn: LoginState.Error);
  }
}