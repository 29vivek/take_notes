import 'package:take_notes/core/services/authentication_service.dart';
import 'package:take_notes/locator.dart';

class LogoutButtonModel {
  
  bool isLoggedOut = false;

  final AuthenticationService _authenticationService = locator<AuthenticationService>();

  Future<void> logout() async {
    isLoggedOut = await _authenticationService.logout();
  }
}