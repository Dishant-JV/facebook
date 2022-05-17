import 'package:facebook/fire_auth/login_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LogInNumber extends StatefulWidget {
  const LogInNumber({Key? key}) : super(key: key);

  @override
  _LogInNumberState createState() => _LogInNumberState();
}

class _LogInNumberState extends State<LogInNumber> {
  GlobalKey<FormState> demos = GlobalKey();
  TextEditingController numberController = TextEditingController();

  FocusNode number = FocusNode();
  String ShowText = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: 200,
          ),
          Container(
            child: Text(
              "LogIn With Phone",
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
          Form(
            key: demos,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: TextFormField(
                controller: numberController,
                focusNode: number,
                validator: (value) {
                  if (value?.length !=10) {
                    return "Plz Enter Valid Mobile Number";
                  }
                },
                onEditingComplete: () {
                  setState(() {
                    FocusScope.of(context).unfocus();
                  });
                },
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    labelText: "Enter NUMBER",
                    labelStyle: TextStyle(color: Colors.grey),
                    isDense: true,
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.blueGrey)),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )),
              ),
            ),
          ),
          ElevatedButton(
              onPressed: () {
                if (demos.currentState!.validate()) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LogInOtp(
                                number: numberController.text.toString(),
                              )));
                }
              },
              child: Text("Submit"))
        ],
      ),
    )));
  }
}
