// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:hs/Services/Authentication.dart';

// class AuthBloc {
//   final authentication = Authentication();
//   final googleSignIn = GoogleSignIn(scopes: ['email']);

//   Stream<User> get currentUser => authentication.currentUser;

//   loginGoogle() async {
//     try {
//       final GoogleSignInAccount googleUser = await googleSignIn.signIn();
//       final GoogleSignInAuthentication googleAuth =
//           await googleUser.authentication;
//       final AuthCredential credential = GoogleAuthProvider.credential(
//         idToken: googleAuth.idToken,
//         accessToken: googleAuth.accessToken,
//       );

//       final result = await authentication.signInwithCredential(credential);

//       print("${result.user.displayName}");
//     } catch (error) {
//       print(error);
//     }
//   }

//   logout() {
//     authentication.logout();
//   }
// }
