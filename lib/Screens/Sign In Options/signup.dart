// import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hs/Screens/HomeScreen.dart';
import 'package:hs/Screens/Sign%20In%20Options/signin.dart';
import 'package:hs/Services/Authentication.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:hs/Services/auth_bloc.dart';

class SignUp extends StatefulWidget {
  SignUp({Key key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  Authentication authentication = Authentication();
  // StreamSubscription<User> loginStateSubscription;

  // @override
  // void initState() {
  //   var authBloc = Provider.of<AuthBloc>(context, listen: false);
  //   loginStateSubscription = authBloc.currentUser.listen((fbUser) {
  //     if (fbUser != null) {
  //       Navigator.pushReplacement(
  //           context,
  //           PageTransition(
  //               child: HomeScreen(),
  //               type: PageTransitionType.leftToRightWithFade));
  //     }
  //   });
  //   super.initState();
  // }

  // @override
  // void dispose() {
  //   loginStateSubscription.cancel();
  //   super.dispose();
  // }

  @override
  Widget build(context) {
    // final authBolc = Provider.of<AuthBloc>(context);
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      body: Container(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Text(
                  'Household Solutions',
                  style: TextStyle(
                    color: const Color(0xff217AF1),
                    fontSize: 35.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 40.0),
                child: Text(
                  'Sign Up',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                  onPressed: () {
                    print("Sign Up with Email...");
                  },
                  icon: Icon(EvaIcons.email),
                  label: Text("Sign Up with Email"),
                ),
              ),
               Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                  onPressed: () {
                    print("Sign Up with Phone No");
                  },
                  icon: Icon(EvaIcons.phone),
                  label: Text("Sign Up with Phone No"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      width: 120.0,
                      child: Divider(
                        color: Color(0xff949494),
                      ),
                    ),
                    Center(
                      child: Text(
                        "OR",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 120.0,
                      child: Divider(
                        color: Color(0xff949494),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                  onPressed: () async {
                    await authentication.googleSignIn().whenComplete(() {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.leftToRightWithFade));
                      },
                    );
                  },
                  icon: Icon(EvaIcons.google),
                  label: Text("Sign Up with Google"),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15.0),
              //   child: ElevatedButton.icon(
              //     style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
              //     onPressed: () async {
              //       print("Sign Up with Facebook...");
              //     },
              //     icon: Icon(EvaIcons.facebook),
              //     label: Text("Sign Up with Facebook"),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                  onPressed: () {
                    print("Sign Up with Apple....");
                  },
                  icon: Icon(FontAwesomeIcons.apple),
                  label: Text("Sign Up with Apple"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account",
                    style: TextStyle(color: Colors.white),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SignIn(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Text(
                      "Log In",
                      style: TextStyle(color: Colors.blue),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 125.0,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "By using our services you are agreeing to our",
                    style: TextStyle(color: Colors.white),
                  ),
                  Text(
                    "\n Terms and Privacy Services",
                    style: TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
