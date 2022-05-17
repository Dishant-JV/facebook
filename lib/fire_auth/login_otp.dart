import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class LogInOtp extends StatefulWidget {
  final String? number;

  const LogInOtp({Key? key, this.number}) : super(key: key);

  @override
  _LogInOtpState createState() => _LogInOtpState();
}

class _LogInOtpState extends State<LogInOtp> {
  void _showSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  String? enteredOtp;
  String? showText;
  bool? isValid;
  bool isWait = false;
  TextEditingController otpController = TextEditingController();

  FocusNode otp = FocusNode();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FirebasePhoneAuthHandler(
      onLoginFailed: (authException) {
        setState(() {
          showText = "Something went wrong(${authException.message})";
        });
      },
      phoneNumber: "+91(${widget.number.toString()})",
      timeOutDuration: const Duration(seconds: 20),
      builder: (context, controller) {
        return SafeArea(
            child: Scaffold(
              body: controller.codeSent
                  ? Column(
                children: [
                  Container(
                    height: 200,
                  ),
                  Container(
                    child: Text(
                      "Enter OTP",
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
                      showText ?? "",
                      style: TextStyle(color: Colors.red),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: EdgeInsets.all(20),
                    child: TextFormField(
                      controller: otpController,
                      focusNode: otp,
                      validator: (value) {
                        if (value?.isEmpty == true) {
                          return "plzz enter otp";
                        }
                      },
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                          labelText: "Enter OTP",
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
                  ElevatedButton(
                      onPressed: () async {
                        // setState(() {
                        //   isWait=true;
                        // });
                        isValid = await controller.verifyOTP(
                            otp: otpController.text.toString());
                        if (isValid == true) {
                          Navigator.pushAndRemoveUntil(
                              context, MaterialPageRoute(builder: (context) =>
                              Fb()), (route) => false);
                        } else {
                          setState(() {
                            isValid == false
                                ? showText = "Enter correct OTP"
                                : showText = "";
                          });
                        }
                      },
                      child: Text("Submit"))
                ],
              )
                  : Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ));
      },
    );
  }
}
