import 'package:facebook/ChatApp/chat_home.dart';
import 'package:facebook/ChatApp/sharedpreference_data.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ChatScreen extends StatefulWidget {
  final int? number;

  const ChatScreen({Key? key, this.number}) : super(key: key);

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  String _value = "";
  bool isEmpty = true;
  TextEditingController getText = TextEditingController();
  final databaseReference = FirebaseDatabase.instance;
  ChatHomeController chatHomeController = Get.put(ChatHomeController());
  String? logInName;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.number);
    getChatData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).padding.top + 50,
              width: double.infinity,
              color: context.theme.hintColor,
              child: Padding(
                padding: const EdgeInsets.only(top: 25),
                child: Row(
                  children: [
                    SizedBox(
                      width: 15,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      widget.number.toString(),
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 23),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              child: Obx(() => ListView.builder(
                reverse: true,
                scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: chatHomeController.chatList.length,
                  itemBuilder: (context, index) {
                    getLogInData().then((value) {
                      setState(() {
                        logInName = value;
                      });
                    });
                    return chatHomeController.chatList[index]['msg']!=""? Container(
                      margin: EdgeInsets.only(
                        bottom: 5,
                        top: 10,
                      ),
                      alignment: chatHomeController.chatList[index]['from'] ==
                                  "$logInName" &&
                              chatHomeController.chatList[index]['to'] ==
                                  "${widget.number}"
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Color(0XFF075E54),
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                        child: Text(
                          chatHomeController.chatList[index]['msg']
                              .toString(),
                          style: TextStyle(fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ):Container();
                  })),
            ),
            Container(
              margin: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.width * 0.011),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.symmetric(
                          horizontal:
                              MediaQuery.of(context).size.width * 0.008),
                      height: MediaQuery.of(context).size.width * 0.119,
                      child: Form(
                        child: TextFormField(
                          controller: getText,
                          cursorColor: Color(0XFF075E54),
                          cursorHeight: 20,
                          showCursor: true,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              contentPadding: EdgeInsets.only(top: 2),
                              suffixIcon: Icon(
                                Icons.camera_alt,
                                color: Colors.white54,
                              ),
                              prefixIcon: Icon(
                                Icons.search_sharp,
                                color: Colors.white54,
                              ),
                              hintText: "Message",
                              hintStyle: TextStyle(
                                  color: Colors.white54, fontSize: 17),
                              filled: true,
                              fillColor: context.theme.hintColor,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(30)),
                              border: OutlineInputBorder()),
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      if (getText.text.isNotEmpty) {
                        setData(getText.text);
                      }
                      getText.clear();
                    },
                    child: Container(
                      margin: EdgeInsets.only(
                          right: MediaQuery.of(context).size.width * 0.008),
                      child: Icon(
                        Icons.send,
                        color: Colors.white,
                      ),
                      height: MediaQuery.of(context).size.width * 0.118,
                      width: MediaQuery.of(context).size.width * 0.118,
                      decoration: BoxDecoration(
                          color: context.theme.hintColor, shape: BoxShape.circle),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            )
          ],
        ),
      ),
    );
  }

  void setData(String text) async {
    print(text);
    int timeStamp = DateTime.now().millisecondsSinceEpoch;
    getLogInData().then((value) {
      databaseReference.ref("ChatData/$value/${widget.number}/$timeStamp").set({
        'msg': '$text',
        'timestamp': '$timeStamp',
        'from': '$value',
        'to': '${widget.number}'
      }).whenComplete(() {
        print("done");
      });
    });
  }

  void getChatData() async {
    getLogInData().then((value) {
      databaseReference
          .ref("ChatData/$value/${widget.number}")
          .onValue
          .listen((event) async {
        Map? data = event.snapshot.value as Map?;
        List? listedData = data?.values.toList();
        listedData?.sort((a, b) => a["timestamp"].compareTo(b["timestamp"]));
        checkChatDataOfFromNumber(widget.number.toString(), listedData!);
      });
    });
  }

  void checkChatDataOfFromNumber(String nums, List lstToData) {
    chatHomeController.chatList.clear();
    getLogInData().then((value) {
      databaseReference
          .ref("ChatData/$nums/$value")
          .onValue
          .listen((event) async {
        if (event.snapshot.exists) {
          Map? data = event.snapshot.value as Map?;
          List? listedFromData = data?.values.toList();
          listedFromData?.addAll(lstToData);
          listedFromData
              ?.sort((a, b) => a["timestamp"].compareTo(b["timestamp"]));
          chatHomeController.chatList.clear();
          List? reversedList=List.from(listedFromData!.reversed);
          chatHomeController.chatList.addAll(reversedList);
          print(chatHomeController.chatList);
        } else {
          chatHomeController.chatList.clear();
          List? reversedList=List.from(lstToData.reversed);
          chatHomeController.chatList.addAll(reversedList);
        }
      });
    });
  }
}
