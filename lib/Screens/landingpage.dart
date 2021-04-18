import 'package:flutter/material.dart';
import 'package:hs/Screens/Sign%20In%20Options/signin.dart';
import 'package:hs/Screens/Sign%20In%20Options/signup.dart';
import 'package:page_transition/page_transition.dart';

class LandingPage extends StatefulWidget {
  LandingPage({Key key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(context) {
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      body: Container(
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20.0),
                  child: Text(
                    'Household Solutions',
                    style: TextStyle(
                      color: const Color(0xff217AF1),
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "Experienced, hand - picked professionals to",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
                 Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    "serve you at your doorstep.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.0,
                    ),
                  ),
                ),
              ]),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xff217AF1),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, PageTransition(child: SignUp(), type: null));
              },
              child: Text(
                "Sign Up",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 52.0,
              child: VerticalDivider(
                color: Color(0xff25282B),
              ),
            ),
            MaterialButton(
              onPressed: () {
                Navigator.pushReplacement(
                    context, PageTransition(child: SignIn(), type: null));
              },
              child: Text(
                "Sign In",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
      
    );
  }
}
