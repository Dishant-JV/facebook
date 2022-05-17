import 'package:facebook/fire_auth/login_number.dart';
import 'package:facebook/fire_auth/registration.dart';
import 'package:facebook/global/global.dart';
import 'package:facebook/screen/menu.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LogIn extends StatefulWidget {
  final String? fillEmail;

  const LogIn({Key? key, this.fillEmail}) : super(key: key);

  @override
  _LogInState createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  bool isProgress = false;
  bool isEmailProgress = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  void googleSignIn(BuildContext context) async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    googleSignIn.disconnect();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();
    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleSignInAuthentication =
          await googleSignInAccount.authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken);
      setState(() {
        isEmailProgress = true;
      });
      showToast('LogIn successfully');
      // Getting users credential
      UserCredential result = await _auth.signInWithCredential(authCredential);
      User? user = result.user;
      if (result != null) {
        setLogin();
        setState(() {
          Global.name = user?.displayName;
          Global.url = user?.photoURL;
        });
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) => Fb(
                      name: user?.displayName,
                      url: user?.photoURL,
                    )));
      }
    }
  }

  void showToast(String text) {
    Fluttertoast.showToast(
        msg: text,
        backgroundColor: Colors.blue,
        gravity: ToastGravity.BOTTOM,
        textColor: Colors.white);
  }

  void setLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', true);
  }

  void login() async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: emailcontroller.text, password: passcontroller.text);
      if (userCredential == null) {
        setState(() {
          ShowText = "error in Login";
          isProgress = false;
        });
      } else {
        setState(() {
          showToast('LogIn successfully');
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Fb()));
          setLogin();
        });
      }
    } on FirebaseException catch (e) {
      if (e.code == 'user-not-found') {
        setState(() {
          ShowText = "User Not Exists Plzz Register Your Self";
          isProgress = false;
        });
      } else if (e.code == 'wrong-password') {
        setState(() {
          ShowText = "Password is Wrong";
          isProgress = false;
        });
      }
    }
  }

  String ShowText = "";
  final demos = GlobalKey<FormState>();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();
  bool ispassvisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          resizeToAvoidBottomInset: false,
          body: isEmailProgress == false
              ? Container(
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 150,
                      ),
                      Container(
                        child: Text(
                          "LogIn yourself",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 25,
                              fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        child: Text(
                          ShowText,
                          style: TextStyle(color: Colors.red),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          child: Form(
                        key: demos,
                        child: Container(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                  // initialValue: widget.fillEmail,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  controller: emailcontroller,
                                  focusNode: email,
                                  validator: (value) {
                                    bool emailValid = RegExp(
                                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                        .hasMatch(value ?? "");
                                    if (!emailValid) {
                                      return "plzz enter valid email";
                                    }
                                  },
                                  textInputAction: TextInputAction.go,
                                  onEditingComplete: () {
                                    setState(() {
                                      FocusScope.of(context).requestFocus(pass);
                                    });
                                  },
                                  keyboardType: TextInputType.emailAddress,
                                  decoration: InputDecoration(
                                      labelText: "Email",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.blueGrey)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.all(20),
                                child: TextFormField(
                                  controller: passcontroller,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    bool passtrue = RegExp(
                                            r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                                        .hasMatch(value ?? "");
                                    if (value!.length < 8) {
                                      return "length must be at least 8 character";
                                    } else if (!passtrue) {
                                      return "character,word,num required";
                                    }
                                  },
                                  focusNode: pass,
                                  obscureText:
                                      ispassvisible == true ? false : true,
                                  decoration: InputDecoration(
                                      suffixIcon: IconButton(
                                        onPressed: () {
                                          setState(() {
                                            ispassvisible = !ispassvisible;
                                          });
                                        },
                                        icon: ispassvisible
                                            ? Icon(
                                                Icons.visibility,
                                                color: Colors.grey,
                                              )
                                            : Icon(
                                                Icons.visibility_off,
                                                color: Colors.grey,
                                              ),
                                      ),
                                      labelText: "Password",
                                      labelStyle: TextStyle(color: Colors.grey),
                                      isDense: true,
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          borderSide: BorderSide(
                                              color: Colors.blueGrey)),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                      )),
                                ),
                              ),
                              isProgress == false
                                  ? Container(
                                      width: 80,
                                      child: ElevatedButton(
                                        onPressed: () {
                                          if (demos.currentState!.validate()) {
                                            FocusScope.of(context).unfocus();

                                            setState(() {
                                              isProgress = true;
                                            });
                                            login();
                                          }
                                        },
                                        child: Text("Log In"),
                                      ),
                                    )
                                  : Container(
                                      child: CircularProgressIndicator(),
                                    ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account ",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15)),
                                    InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    Registration()));
                                      },
                                      child: Text("Register",
                                          style: TextStyle(
                                              color: Colors.blue,
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16)),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {
                          googleSignIn(context);
                        },
                        child: Container(
                          height: 50,
                          width: 290,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: LinearGradient(colors: [
                                Colors.red.withOpacity(0.6),
                                Colors.yellow.withOpacity(0.7)
                              ])),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                child: IconButton(
                                  icon: FaIcon(FontAwesomeIcons.google),
                                  onPressed: () {},
                                  color: Colors.red,
                                ),
                              ),
                              Container(
                                child: Text(
                                  "SignIn with Google",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black38,
                                      fontSize: 19),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        height: 50,
                        width: 290,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            gradient: LinearGradient(colors: [
                              Colors.blue.withOpacity(0.6),
                              Colors.blueGrey.withOpacity(0.7)
                            ])),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                child: Icon(
                              Icons.call,
                              color: Colors.blue.shade900,
                              size: 28,
                            )),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogInNumber()));
                              },
                              child: Container(
                                margin: EdgeInsets.only(left: 10),
                                child: Text(
                                  "SignIn with Phone",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black38,
                                      fontSize: 19),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Center(
                  child: CircularProgressIndicator(),
                )),
    );
  }
}
