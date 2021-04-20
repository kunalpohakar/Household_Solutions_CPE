// import 'dart:async';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hs/Screens/HomeScreen.dart';
import 'package:hs/Screens/Sign%20In%20Options/phone_login.dart';
import 'package:hs/Screens/Sign%20In%20Options/signup.dart';
import 'package:hs/Services/Authentication.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:hs/Services/auth_bloc.dart';

class SignIn extends StatefulWidget {
  SignIn({Key key}) : super(key: key);

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  Authentication authentication = Authentication();
  
  @override
  Widget build(context) {
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
                  'Sign In',
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
                    print("Sign In with Email...");
                  },
                  icon: Icon(EvaIcons.email),
                  label: Text("Sign In with Email"),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                  onPressed: () async{
                     Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: Phonelogin(),
                                type: PageTransitionType.leftToRightWithFade));
                  },
                  icon: Icon(EvaIcons.phone),
                  label: Text("Sign In with Phone No"),
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
                    await authentication.googleSignIn().whenComplete(
                      () {
                        Navigator.pushReplacement(
                            context,
                            PageTransition(
                                child: HomeScreen(),
                                type: PageTransitionType.leftToRightWithFade));
                      },
                    );
                  },
                  icon: Icon(EvaIcons.google),
                  label: Text("Sign In with Google"),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.only(bottom: 15.0),
              //   child: ElevatedButton.icon(
              //     style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
              //     onPressed: () {},
              //     icon: Icon(EvaIcons.facebook),
              //     label: Text("Sign In with Facebook"),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(bottom: 15.0),
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                  onPressed: () {
                    print("Sign In with Apple....");
                  },
                  icon: Icon(FontAwesomeIcons.apple),
                  label: Text("Sign In with Apple"),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "New here ?",
                    style: TextStyle(color: Colors.white),
                  ),
                  MaterialButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          PageTransition(
                              child: SignUp(),
                              type: PageTransitionType.bottomToTop));
                    },
                    child: Text(
                      "Create an account",
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
