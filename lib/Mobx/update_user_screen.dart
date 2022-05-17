import 'dart:io';
import 'package:facebook/Mobx/usse_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';

class UpdateUserScreen extends StatefulWidget {
  final int? index;

  const UpdateUserScreen({Key? key, this.index}) : super(key: key);

  @override
  _UpdateUserScreenState createState() => _UpdateUserScreenState();
}

class _UpdateUserScreenState extends State<UpdateUserScreen> {
  var image;
  int index = 0;
  String? imagee;
  TextEditingController nameController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  ImagePicker imagePicker = ImagePicker();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    index = widget.index!;
    print(widget.index);
    nameController.text = mobxSignUpModel.userDataList[index].name!;
    numberController.text = mobxSignUpModel.userDataList[index].number!;
    imagee = mobxSignUpModel.userDataList[index].img!;
  }

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
              CircleAvatar(
                  radius: 50,
                  backgroundImage: FileImage(File(imagee.toString()))),
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
              mobxSignUpModel.updateList(
                  UserData(
                      img: imagee,
                      name: nameController.text,
                      number: numberController.text),
                  index);
              print(mobxSignUpModel.userDataList);
              Navigator.pop(context);
            },
            child: Text("Update"))
      ],
    ));
  }

  Widget textField(
      String hint, TextEditingController controller, TextInputType inputType) {
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
