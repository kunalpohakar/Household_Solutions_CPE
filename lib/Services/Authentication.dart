import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:flutter_facebook_login/flutter_facebook_login.dart';
import 'package:hs/Services/Storage.dart';

class Authentication {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final fbLogin = FacebookLogin();
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final SecureStorage secureStorage = SecureStorage();

  Future<String> googleSignIn() async {
    final GoogleSignInAccount googleSignInAccount =
        await _googleSignIn.signIn();
    final GoogleSignInAuthentication googleSignInAuthentication =
        await googleSignInAccount.authentication;
    final AuthCredential authCredential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken);
    final UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(authCredential);
    final User user = userCredential.user;
    assert(user.displayName != null);
    assert(user.email != null);
    final User currentUser = _firebaseAuth.currentUser;
    assert(currentUser.uid == user.uid);

    secureStorage.writeSecureData('email', user.email);
    secureStorage.writeSecureData('name', user.displayName);

    return "Error Occurred";
  }

  Future<String> googleSignOut() async {
    _googleSignIn.signOut();

    return "Error Occurred";
  }
}
