import 'package:facebook/fire/registration_screen.dart';
import 'package:flutter/material.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({Key? key}) : super(key: key);

  @override
  _SigninScreenState createState() => _SigninScreenState();
}

class _SigninScreenState extends State<SigninScreen> {
  final demos = GlobalKey<FormState>();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passcontroller = new TextEditingController();
  FocusNode email = FocusNode();
  FocusNode pass = FocusNode();
  bool ispassvisible=false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: MediaQuery
                  .of(context)
                  .size
                  .width * 0.3,
            ),
            Container(
              child: Text(
                "Log In Here",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.blue),
              ),
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
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
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value){
                              bool passtrue=RegExp(r'^(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$').hasMatch(value ?? "");
                              if(value!.length < 8){
                                return "length must be at least 8 character";
                              } else if(!passtrue){
                                return "characte,word,num required";
                              }
                            },
                            focusNode: pass,
                            obscureText: ispassvisible== true ? false : true,
                            decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  onPressed: (){
                                    setState(() {
                                      ispassvisible =!ispassvisible;
                                    });
                                  },
                                  icon:ispassvisible ? Icon(Icons.visibility,color: Colors.grey,) : Icon(Icons.visibility_off,color: Colors.grey,),
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
                              if (demos.currentState!.validate()) {
                                FocusScope.of(context).unfocus();
                              }
                            },
                            child: Text("Log In"),
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
                              Text("Don't have account then ",
                                  style:
                                  TextStyle(color: Colors.black, fontSize: 15)),
                              InkWell(
                                onTap: (){
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => RegistrationScreen()));
                                },
                                child: Text("Create Account", style: TextStyle(
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
