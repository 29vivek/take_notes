import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthenticationService {

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Stream<FirebaseUser> get user => _firebaseAuth.onAuthStateChanged;
  Future<FirebaseUser> get getUser => _firebaseAuth.currentUser();

  Future<bool> loginWithGoogle() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn().catchError((_) { print(_); });
    
    if(googleUser == null)
      return false;

    final GoogleSignInAuthentication googleAuth = await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.getCredential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );
    
    try {
      await _firebaseAuth.signInWithCredential(credential);

      return true;
    } catch(_) {
      print(_);
      return false;
    }
  }

  Future<bool> logout() async {
    try {
      await _firebaseAuth.signOut().then((_) async => await _googleSignIn.disconnect());
      return true;
    } catch(_) {
      print(_);
      return false;
    }
    
  }

}