import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hs/Screens/HomeScreen.dart';
import 'package:page_transition/page_transition.dart';

enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class Phonelogin extends StatefulWidget {
  @override
  _PhoneloginState createState() => _PhoneloginState();
}

class _PhoneloginState extends State<Phonelogin> {
  final phoneController = TextEditingController();
  final otpController = TextEditingController();

  FirebaseAuth _auth = FirebaseAuth.instance;

  String verficationId;
  bool showLoading = false;

  void signInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCrendtial) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCrendtial);

      setState(() {
        showLoading = false;
      });

      if (authCredential?.user != null) {
        Navigator.push(
            context,
            PageTransition(
                child: HomeScreen(), type: PageTransitionType.bottomToTop));
      }
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });

      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text(e.message),
      ));
    }
  }

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;

  getMobileFormWidget(context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0, top: 30.0),
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
              'Login with Phone No',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
            height: 40.0,
          ),
          Text(
            "Please Provide Country Code",
            style: TextStyle(fontSize: 22.0, color: Colors.white),
          ),
          SizedBox(
            height: 30.0,
          ),
          TextField(
            controller: phoneController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: "Phone number",
              hintStyle: TextStyle(
                color: Colors.grey,
              ),
            ),
          ),
          SizedBox(height: 16.0),
          MaterialButton(
            onPressed: () async {
              setState(() {
                showLoading = true;
              });

              await _auth.verifyPhoneNumber(
                phoneNumber: phoneController.text,
                verificationCompleted: (phoneAuthCredential) async {
                  setState(() {
                    showLoading = false;
                  });
                  //signInWithPhoneAuthCredential(phoneAuthCrendtial);
                },
                verificationFailed: (verificationFailed) async {
                  setState(() {
                    showLoading = false;
                  });
                  _scaffoldKey.currentState.showSnackBar(
                      SnackBar(content: Text(verificationFailed.message)));
                },
                codeSent: (verificationId, resendingToken) async {
                  setState(() {
                    showLoading = false;
                    currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
                    this.verficationId = verificationId;
                  });
                },
                codeAutoRetrievalTimeout: (verification) async {},
              );
            },
            child: Text("Send"),
            color: const Color(0xff217AF1),
            textColor: Colors.white,
          ),
          SizedBox(
            height: 80.0,
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
    );
  }

  getOtpFormWidget(BuildContext context) {
    return SafeArea(
      child: Expanded(
        child: Padding(
          padding: const EdgeInsets.only(top: 80.0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(bottom: 20.0, top: 30.0),
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
                  'Enter OTP',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              // Spacer(),
              TextField(
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                controller: otpController,
                decoration: InputDecoration(
                  hintText: "Enter Otp",
                  hintStyle: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 16.0),
              MaterialButton(
                onPressed: () async {
                  PhoneAuthCredential phoneAuthCrendtial =
                      PhoneAuthProvider.credential(
                    verificationId: verficationId,
                    smsCode: otpController.text,
                  );
                  signInWithPhoneAuthCredential(phoneAuthCrendtial);
                },
                child: Text("Verify"),
                color: const Color(0xff217AF1),
                textColor: Colors.white,
              ),
              // Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff25282B),
      key: _scaffoldKey,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: const Color(0xff25282B),
      //   title: Text(
      //     "",
      //     style: TextStyle(
      //       fontWeight: FontWeight.bold,
      //       color: Colors.white,
      //     ),
      //   ),
      // ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: showLoading
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : currentState ==
                          MobileVerificationState.SHOW_MOBILE_FORM_STATE
                      ? getMobileFormWidget(context)
                      : getOtpFormWidget(context),
              padding: EdgeInsets.all(20.0),
            ),
          ],
        ),
      ),
    );
  }
}
