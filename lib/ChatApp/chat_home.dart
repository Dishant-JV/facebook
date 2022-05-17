import 'dart:convert';

import 'package:facebook/ChatApp/chat_login.dart';
import 'package:facebook/ChatApp/chat_model.dart';
import 'package:facebook/ChatApp/chat_screen.dart';
import 'package:facebook/change_theme_demo.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:facebook/ChatApp/sharedpreference_data.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatHome extends StatefulWidget {
  const ChatHome({Key? key}) : super(key: key);

  @override
  _ChatHomeState createState() => _ChatHomeState();
}

class _ChatHomeState extends State<ChatHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  final numberController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ChatHomeController chatHomeController = Get.put(ChatHomeController());
  final databaseReference = FirebaseDatabase.instance;
  ChangeTheme changeTheme = Get.put(ChangeTheme());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top + 20,
          ),
          Switch(
              value: changeTheme.isDarkMode.value,
              onChanged: (value) {
                if (Get.isDarkMode) {
                  changeTheme.isDarkMode.value = false;
                  Get.changeThemeMode(ThemeMode.light);
                } else {
                  changeTheme.isDarkMode.value = true;
                  Get.changeThemeMode(ThemeMode.dark);
                }
              }),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: context.theme.highlightColor),
                    onPressed: () async {
                      SharedPreferences preferences =
                          await SharedPreferences.getInstance();
                      preferences.clear().then((value) {
                        Get.offAll(ChatLogIN());
                      });
                    },
                    child: Text(
                      "LogOut",
                      style: TextStyle(color: context.theme.backgroundColor),
                    )),
              ),
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Dialog(
                            child: Container(
                              height: 200,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Add Number",
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18),
                                  ),
                                  Obx(() => Container(
                                        height: 14,
                                        child: Text(
                                          chatHomeController.errorMsg
                                              .toString(),
                                          style: TextStyle(
                                              color: Colors.red, fontSize: 12),
                                        ),
                                      )),
                                  Form(
                                    key: _formKey,
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextFormField(
                                        validator: (value) {
                                          String patttern =
                                              r'(^(?:[+0]9)?[0-9]{10,12}$)';
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
                                            hintText: "Number",
                                            border: OutlineInputBorder()),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (_formKey.currentState!.validate()) {
                                        getLogInData().then((value) {
                                          if (value == numberController.text) {
                                            chatHomeController.errorMsg.value =
                                                "Number alreday logged in";
                                          } else {
                                            addNumberToFirebase(
                                                numberController.text);
                                            Navigator.pop(context);
                                            chatHomeController.errorMsg.value =
                                                "";
                                            numberController.clear();
                                            chatHomeController.noDataMsg.value =
                                                false;
                                          }
                                        });
                                      }
                                    },
                                    child: Text("Submit"),
                                  )
                                ],
                              ),
                            ),
                          );
                        });
                      });
                },
                child: Container(
                  margin: EdgeInsets.only(right: 10),
                  alignment: Alignment.center,
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                      color: context.theme.highlightColor,
                      shape: BoxShape.circle),
                  child: Icon(
                    Icons.add,
                    size: 30,
                    color: context.theme.backgroundColor,
                  ),
                ),
              ),
            ],
          ),
          Obx(() => chatHomeController.noDataMsg.value == false
              ? Expanded(
                  child: ListView.builder(
                    itemCount: chatHomeController.numberList.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          Get.to(ChatScreen(
                            number:
                                int.parse(chatHomeController.numberList[index]),
                          ));
                        },
                        child: Card(
                          child: Container(
                              alignment: Alignment.center,
                              height: 50,
                              width: double.infinity,
                              child: Text(
                                chatHomeController.numberList[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 17),
                              )),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Text("No Number"),
                ))
        ],
      ),
    );
  }

  void getData() async {
    List? keys = [];
    chatHomeController.numberList.clear();
    getLogInData().then((value) {
      databaseReference.ref("ChatData/$value").onValue.listen((event) async {
        if (event.snapshot.exists) {
          Map? data = event.snapshot.value as Map?;
          keys = data?.keys.toList();
          chatHomeController.numberList.clear();
          if (keys?.length != 0) {
            chatHomeController.numberList.addAll(keys!);
          }
        } else {
          chatHomeController.noDataMsg.value = true;
        }
      });
    });
  }

  void addNumberToFirebase(String nums) async {
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    String msg = "";
    getLogInData().then((value) {
      print(value);
      databaseReference.ref("ChatData/$value/$nums/$timeStamp").set({
        'msg': '$msg',
        'timestamp': '$timeStamp',
        'from': '$value',
        'to': '$nums'
      }).whenComplete(() {
        getData();
      });
    });
  }
}

class ChatHomeController extends GetxController {
  RxList numberList = [].obs;
  RxString errorMsg = "".obs;
  RxList chatList = [].obs;
  RxBool noDataMsg = false.obs;
}
