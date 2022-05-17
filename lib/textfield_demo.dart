import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextfieldDemo extends StatefulWidget {
  const TextfieldDemo({Key? key}) : super(key: key);

  @override
  _TextfieldDemoState createState() => _TextfieldDemoState();
}

class _TextfieldDemoState extends State<TextfieldDemo> {
  final emailController = TextEditingController();
  String name = "";
  bool isVisible = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: InkWell(
          onTap: (){
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 100),
                Container(
                  height: 40,
                  width: 350,
                  child: TextField(
                    style: TextStyle(fontFamily: 'Baroda'),
                    onSubmitted: (value) {
                      setState(() {
                        this.name = value;
                      });
                    },
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: "Email",
                        hintText: "Enter your email here",
                        labelStyle: GoogleFonts.getFont('Mukta Vaani'),
                        suffixIcon: emailController.text.isEmpty
                            ? Container(
                                width: 0,
                              )
                            : IconButton(
                                icon: Icon(Icons.cancel_rounded),
                                onPressed: () {
                                  emailController.clear();
                                },
                              )),
                    cursorHeight: 25,
                    cursorColor: Colors.orange,
                    keyboardType: TextInputType.emailAddress,
                    textInputAction: TextInputAction.done,
                    controller: emailController,
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 40,
                  width: 350,
                  child: TextField(
                    decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: BorderSide(color: Colors.red, width: 2)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.green,width: 2)
                        ),
                        labelText: "password",
                        hintText: "Enter your password here",
                        hintStyle: TextStyle(fontSize: 13),
                        suffixIcon: IconButton(
                            onPressed: () {
                              setState(() {
                                isVisible = !isVisible;
                              });
                            },
                            icon: isVisible
                                ? Icon(Icons.visibility_off)
                                : Icon(Icons.visibility))),
                    cursorHeight: 20,
                    obscureText: isVisible,
                  ),
                ),
                SizedBox(
                  height: 100,
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      print(emailController.text);
                    });
                  },
                  child: Container(
                    height: 30,
                    width: 100,
                    color: Colors.pink,
                    child: Text("submit"),
                  ),
                ),
                Text(
                  'raj',
                  style: TextStyle(fontFamily: 'Baroda'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
