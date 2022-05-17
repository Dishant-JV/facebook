import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/fire/registration_screen.dart';
import 'package:facebook/global/textfieldwidget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'login.dart';

class Registration extends StatefulWidget {
  const Registration({Key? key}) : super(key: key);

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  bool isProgress = false;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  CollectionReference loginDetail =
      FirebaseFirestore.instance.collection("login detail");

  void registration() async {
    setState(() {
      isProgress = true;
    });
    try {
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: emailController.text, password: passController.text);

      if (userCredential.user?.email != null) {
        Fluttertoast.showToast(
            msg: 'Registration Done',
            backgroundColor: Colors.blue,
            gravity: ToastGravity.BOTTOM,
            textColor: Colors.white);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LogIn(
                      fillEmail: userCredential.user?.email,
                    )));
      }
    } on FirebaseException catch (e) {
      if (e.code == 'email-already-in-use') {
        setState(() {
          showText = "User already Exists Plzz SignIn";
          isProgress = false;
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> insertFirestore(
      String name, String phone, String email, String pass) async {
    print("Function called");
    print(name);
    return loginDetail
        .add({'email': email, 'name': name, 'password': pass, 'phone': phone})
        .then((value) {
          print(value);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LogIn()));

    })
        .catchError((error) {
          print("Failed to add user: $error");
        });
  }

  String showText = "";
  final demos = GlobalKey<FormState>();
  TextEditingController nameController = new TextEditingController();
  TextEditingController phoneController = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController passController = new TextEditingController();
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();
  FocusNode name = FocusNode();
  FocusNode phone = FocusNode();
  bool ispassvisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 100,
              ),
              Container(
                child: Text(
                  "Register Your Self",
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
                  showText,
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
                        child: TextFieldWidget(
                            isDense: true,
                            labelText: 'Name',
                            labelTextColor: Colors.grey,
                            controller: nameController,
                            focusNode: name,
                            onEditingComplete: () {
                              setState(() {
                                FocusScope.of(context).requestFocus(phone);
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter some value";
                              }
                            },
                            keyboardType: TextInputType.name),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFieldWidget(
                            isDense: true,
                            labelText: 'Phone',
                            labelTextColor: Colors.grey,
                            controller: phoneController,
                            focusNode: phone,
                            onEditingComplete: () {
                              setState(() {
                                FocusScope.of(context).requestFocus(email);
                              });
                            },
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Enter some value";
                              }
                            },
                            keyboardType: TextInputType.phone),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFieldWidget(
                            autovalidatemode:
                                AutovalidateMode.onUserInteraction,
                            isDense: true,
                            labelText: 'Email',
                            labelTextColor: Colors.grey,
                            controller: emailController,
                            focusNode: email,
                            onEditingComplete: () {
                              setState(() {
                                FocusScope.of(context).requestFocus(pass);
                              });
                            },
                            validator: (value) {
                              bool emailValid = RegExp(
                                      r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                  .hasMatch(value ?? "");
                              if (!emailValid) {
                                return "plzz enter valid email";
                              }
                            },
                            keyboardType: TextInputType.emailAddress),
                      ),
                      Padding(
                        padding: EdgeInsets.all(20),
                        child: TextFieldWidget(
                          obscureText: ispassvisible == false ? true : false,
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
                          autovalidatemode: AutovalidateMode.onUserInteraction,
                          isDense: true,
                          labelText: 'Password',
                          labelTextColor: Colors.grey,
                          controller: passController,
                          focusNode: pass,
                          onEditingComplete: () {
                            setState(() {
                              FocusScope.of(context).unfocus();
                            });
                          },
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
                        ),
                      ),
                      isProgress == false
                          ? Container(
                              width: 90,
                              child: ElevatedButton(
                                onPressed: () {
                                  if (demos.currentState!.validate()) {
                                    FocusScope.of(context).unfocus();
                                    insertFirestore(
                                        nameController.text,
                                        phoneController.text,
                                        emailController.text,
                                        passController.text);
                                     registration();
                                  }
                                },
                                child: Text("Register"),
                              ),
                            )
                          : CircularProgressIndicator(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have account ",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 15)),
                            InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => LogIn()));
                              },
                              child: Text("Log In",
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
            ],
          ),
        ),
      ),
    );
  }
}
