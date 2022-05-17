import 'package:facebook/ChatApp/chat_home.dart';
import 'package:facebook/ChatApp/sharedpreference_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatLogIN extends StatefulWidget {
  const ChatLogIN({Key? key}) : super(key: key);

  @override
  _ChatLogINState createState() => _ChatLogINState();
}

class _ChatLogINState extends State<ChatLogIN> {
  final _formKey = GlobalKey<FormState>();
  final numberController = TextEditingController();
  final databaseReference = FirebaseDatabase.instance;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getLogInInfo().then((value) {
      value == true ? Get.to(ChatHome()) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 300,
          ),
          Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (value) {
                      String patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                      RegExp regExp = new RegExp(patttern);
                      if (value?.length == 0) {
                        return 'Please enter mobile number';
                      } else if (!regExp.hasMatch(value!)) {
                        return 'Please enter valid mobile number';
                      }
                    },
                    keyboardType: TextInputType.number,
                    controller: numberController,
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: context.theme.primaryColor),
                        hintText: "Number",
                        border: OutlineInputBorder()),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
            style:
                ElevatedButton.styleFrom(primary: context.theme.highlightColor),
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                saveNumber(numberController.text);
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => ChatHome()));
              }
            },
            child: Text(
              "Submit",
              style: TextStyle(color: context.theme.backgroundColor),
            ),
          )
        ],
      ),
    );
  }

  void saveNumber(String num) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("number", num);
    preferences.setBool("login", true);
    print(preferences.getString('number'));
  }
}
