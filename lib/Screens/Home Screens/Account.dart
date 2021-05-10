// import 'dart:async';

// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hs/Screens/landingpage.dart';

import 'package:hs/Services/Authentication.dart';
import 'package:hs/Services/Storage.dart';
import 'package:page_transition/page_transition.dart';
// import 'package:provider/provider.dart';
// import 'package:hs/Services/auth_bloc.dart';

class Account extends StatefulWidget {
  Account({Key key}) : super(key: key);

  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  Authentication authentication = Authentication();
  SecureStorage secureStorage = SecureStorage();
  // StreamSubscription<User> loginStateSubscription;

  // @override
  // void initState() {
  //   var authBloc = Provider.of<AuthBloc>(context, listen: false);
  //   loginStateSubscription = authBloc.currentUser.listen((fbUser) {
  //     if (fbUser == null) {
  //       Navigator.pushReplacement(
  //           context,
  //           PageTransition(
  //               child: LandingPage(),
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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      appBar: AppBar(
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(Icons.account_box),
            onPressed: () {
              print("Cart");
            },
          )
        ],
        backgroundColor: const Color(0xff25282B),
        title: Text(
          "Account",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 300.0,
              width: 400.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 8.0,
                      right: 8.0,
                    ),
                    child: Container(
                      height: 200.0,
                      width: 250.0,
                      child: Image(
                        image: AssetImage('images/logo.png'),
                      ),
                      // color: Colors.cyan,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 45.0),
                    child: MaterialButton(
                      onPressed: () {
                        print("Business");
                      },
                      child: Text(
                        "Try HS for Business",
                        style: TextStyle(
                          color: const Color(0xff217AF1),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Account Settings",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Account Security",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Email notification preferences",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Support",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "About HS",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "About HS for Business",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Frequently asked questions",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Share the HS app",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Text(
                "Diagnostics",
                style: TextStyle(color: Colors.blueGrey),
              ),
            ),
            ListTile(
              trailing: Icon(
                Icons.arrow_forward_ios_sharp,
                color: Colors.white,
              ),
              title: Text(
                "Status",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 19.0,
                ),
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            Center(
              child: MaterialButton(
                color: const Color(0xff217AF1),
                // style: ElevatedButton.styleFrom(primary: Color(0xff217AF1)),
                onPressed: () async {
                  await authentication.googleSignOut().whenComplete(() {
                    secureStorage.deleteSecureData('email');
                  }).whenComplete(() {
                    Navigator.pushReplacement(
                        context,
                        PageTransition(
                            child: LandingPage(),
                            type: PageTransitionType.leftToRightWithFade));
                  });
                },
                child: Text(
                  "Sign Out",
                  style: TextStyle(
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 25.0, bottom: 10.0),
                child: Text(
                  "HS v1.0.0",
                  style: TextStyle(color: Colors.blueGrey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
