import 'package:facebook/Mobx/update_user_screen.dart';
import 'package:facebook/Mobx/usse_data.dart';
import 'package:flutter/material.dart';
import 'package:facebook/main.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'dart:io';
import 'mobx_signup_model.dart';

class MobxSignUpHome extends StatefulWidget {
  const MobxSignUpHome({Key? key}) : super(key: key);

  @override
  _MobxSignUpHomeState createState() => _MobxSignUpHomeState();
}

class _MobxSignUpHomeState extends State<MobxSignUpHome> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("list data");
    print(mobxSignUpModel.userDataList != null
        ? mobxSignUpModel.userDataList[0].number
        : 0);
    print(mobxSignUpModel.userDataList.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Observer(builder: (_) {
        return mobxSignUpModel.userDataList != null &&
                mobxSignUpModel.userDataList.length > 0
            ? ListView.builder(
                shrinkWrap: false,
                itemCount: mobxSignUpModel.userDataList.length,
                itemBuilder: (context, index) {
                  UserData userData = mobxSignUpModel.userDataList[index];
                  return Container(
                    child: Card(
                      color: Colors.grey.shade100,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CircleAvatar(
                                      radius: 40,
                                      backgroundImage: FileImage(
                                          File(userData.img.toString())),
                                    ),
                                  ],
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UpdateUserScreen(
                                                index: index,
                                              )));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.only(right: 5),
                                  child: Icon(
                                    Icons.update,
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Name : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Text(
                                userData.name.toString(),
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 20,
                                    color: Colors.blue),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Number : ",
                                style: TextStyle(
                                    fontWeight: FontWeight.w500, fontSize: 20),
                              ),
                              Text(userData.number.toString(),
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 20,
                                      color: Colors.blue)),
                            ],
                          )
                        ],
                      ),
                    ),
                  );
                })
            : Container();
      }),
    );
  }
}
