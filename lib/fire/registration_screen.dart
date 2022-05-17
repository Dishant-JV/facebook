import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/fire/signin_screen.dart';
import 'package:flutter/material.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  _RegistrationScreenState createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  String mm = "";
  String emails = "";
  bool mks = false;
  final List storedocs = [];
  final Stream<QuerySnapshot> checkReg =
      FirebaseFirestore.instance.collection('Registrationtbl').snapshots();
  final CollectionReference reg =
      FirebaseFirestore.instance.collection('Registrationtbl');
  final Stream<QuerySnapshot> checkEmail =
      FirebaseFirestore.instance.collection('Registrationtbl').snapshots();

  Future<void>? userAdd(String name, String num, String email, String pass) {
    StreamBuilder(
      stream: checkEmail,
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        snapshot.data?.docs.map((DocumentSnapshot document) {
          Map a = document.data() as Map<String, dynamic>;
          storedocs.add(a);
        }).toList();
        // if(storedocs.length == 0){
        //   return reg
        //       .add({'name': name, 'number': num, 'email': email, 'password': pass})
        //       .then((value) =>
        //       showDialog(
        //           context: context,
        //           builder: (BuildContext context) {
        //             return AlertDialog(
        //               title: Text("User is Added"),
        //               actions: [
        //                 ElevatedButton(
        //                     onPressed: () {
        //                       Navigator.pop(context);
        //                       Navigator.push(
        //                           context,
        //                           MaterialPageRoute(
        //                               builder: (context) => SigninScreen()));
        //                     },
        //                     child: Text("OK"))
        //               ],
        //             );
        //           }))
        //       .catchError((error) =>
        //       AlertDialog(
        //         title: Text(
        //           "Error in Registration",
        //           style: TextStyle(color: Colors.red),
        //         ),
        //       ));
        // }
        return Container();
        if (storedocs.length > 0) {
          setState(() {
            mks = true;
          });
        }
      },
    );
  }

  final demos = GlobalKey<FormState>();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController numbercontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();
  FocusNode name = FocusNode();
  FocusNode number = FocusNode();
  bool ispassvisible = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width * 0.3,
            ),
            Container(
              child: Text(
                "Register Your Self Here",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue),
              ),
            ),
            mks == true
                ? Text(
                    "User already Exist",
                    style: TextStyle(color: Colors.red),
                  )
                : Text(""),
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
                        controller: namecontroller,
                        focusNode: name,
                        validator: (value) {
                          if (namecontroller.text.isEmpty) {
                            return "enter some name";
                          }
                        },
                        textInputAction: TextInputAction.go,
                        onEditingComplete: () {
                          setState(() {
                            FocusScope.of(context).requestFocus(number);
                          });
                        },
                        keyboardType: TextInputType.name,
                        decoration: InputDecoration(
                            labelText: "Name",
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
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: numbercontroller,
                        focusNode: number,
                        validator: (value) {
                          if (numbercontroller.text.length != 10) {
                            return "enter valid number";
                          }
                        },
                        textInputAction: TextInputAction.go,
                        onEditingComplete: () {
                          setState(() {
                            FocusScope.of(context).requestFocus(email);
                          });
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            labelText: "Number",
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
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
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
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20),
                      child: TextFormField(
                        controller: passcontroller,
                        validator: (value) {
                          bool passtrue = RegExp(
                                  r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value ?? "");
                          if (value!.length < 8) {
                            return "length must be at least 8 character";
                          } else if (!passtrue) {
                            return "characte,word,num required";
                          }
                        },
                        focusNode: pass,
                        obscureText: ispassvisible == true ? false : true,
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
                                borderRadius: BorderRadius.circular(20),
                                borderSide: BorderSide(color: Colors.blueGrey)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                            )),
                      ),
                    ),
                    Container(
                      width: 80,
                      child: ElevatedButton(
                        onPressed: () {
                          print(storedocs);
                          if (demos.currentState!.validate()) {
                            FocusScope.of(context).unfocus();
                            if (mks == false) {
                              userAdd(
                                  namecontroller.text,
                                  numbercontroller.text,
                                  emailcontroller.text,
                                  passcontroller.text);
                              namecontroller.clear();
                              numbercontroller.clear();
                              emailcontroller.clear();
                              passcontroller.clear();
                            }
                          }
                        },
                        child: Text(
                          "Register",
                          style: TextStyle(fontSize: 12),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("If you have Already have account then ",
                              style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SigninScreen()));
                            },
                            child: Text("Sign In",
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
    );
  }
}
