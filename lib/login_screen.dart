import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'generated/l10n.dart';
import 'main.dart';

class LoginWithGoogleScreen extends StatefulWidget {
  const LoginWithGoogleScreen({Key? key}) : super(key: key);

  @override
  State<LoginWithGoogleScreen> createState() => _LoginWithGoogleScreenState();
}

class _LoginWithGoogleScreenState extends State<LoginWithGoogleScreen> {
  GoogleSignIn _googleSignIn = GoogleSignIn();
  late FirebaseAuth _auth;
  bool isUserSignedIn = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(130, 50),
                    ),
                    onPressed: () {
                      setState(() {
                        S.load(Locale("gu"));
                      });
                    },
                    child: Text(
                      "Gujarati",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      fixedSize: const Size(130, 50),
                    ),
                    onPressed: () { setState(() {
                      S.load(Locale("en","US"));
                    });},
                    child: Text(
                      "English",
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    )),
              ],
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.brown,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: const Size(140, 50),
                  ),
                  onPressed: () {

                  },
                  child: Text(
                    S().sendOtp,
                    style: TextStyle(
                      fontSize: 18,
                        fontFamily: 'Baroda'

                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}

