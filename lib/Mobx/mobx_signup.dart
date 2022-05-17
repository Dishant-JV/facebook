import 'dart:io';

import 'package:facebook/Mobx/mobx_signup_home.dart';
import 'package:facebook/Mobx/usse_data.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import 'mobx_signup_model.dart';

class MObxSignUP extends StatefulWidget {
  const MObxSignUP({Key? key}) : super(key: key);

  @override
  _MObxSignUPState createState() => _MObxSignUPState();
}

class _MObxSignUPState extends State<MObxSignUP> {
  var image;
  String? imagee;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          InkWell(
            onTap: () {
              pickImage();
            },
            child: Column(
              children: [
                imagee != null
                    ? CircleAvatar(
                    radius: 50,
                    backgroundImage: FileImage(File(imagee.toString())))
                    : CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        'https://static.vecteezy.com/system/resources/previews/002/318/271/original/user-profile-icon-free-vector.jpg')),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Choose Photo",
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          textField("Name", nameController, TextInputType.text),
          SizedBox(
            height: 15,
          ),
          textField("Number", numberController, TextInputType.number),
          SizedBox(
            height: 15,
          ),
          ElevatedButton(
              onPressed: () {
                mobxSignUpModel.addToList(UserData(
                    img: imagee,
                    name: nameController.text,
                    number: numberController.text));
                print(mobxSignUpModel.userDataList);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => MobxSignUpHome()));
              },
              child: Text("Add"))
        ],
      ),
    );
  }

  Widget textField(String hint, TextEditingController controller,
      TextInputType inputType) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: inputType,
        controller: controller,
        decoration:
        InputDecoration(hintText: hint, border: OutlineInputBorder()),
      ),
    );
  }

  void pickImage() async {
    image = await imagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      imagee = image?.path;
    });
  }
}
