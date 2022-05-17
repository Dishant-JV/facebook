import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class RealTimeDataFirestore extends StatefulWidget {
  const RealTimeDataFirestore({Key? key}) : super(key: key);

  @override
  _RealTimeDataFirestoreState createState() => _RealTimeDataFirestoreState();
}

class _RealTimeDataFirestoreState extends State<RealTimeDataFirestore> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final key = GlobalKey<FormState>();
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  UploadedState uploadedState=Get.put(UploadedState());
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    uploadedState.StartStream();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).padding.top,
          ),
          Form(
            key: key,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: nameController,
                    decoration: InputDecoration(),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passController,
                    decoration: InputDecoration(),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      saveData(nameController.text, passController.text);
                    },
                    child: Text("submit")),
                StreamBuilder(
                    stream:  uploadedState.streamController.stream,
                    builder: (BuildContext context,AsyncSnapshot<dynamic> snapshot){
                     var datas= snapshot.data;
                     print("dara");
                     print(datas);
                      return Text("Stream ");
                    }
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void saveData(String name, String pass) async {
    await fireStore
        .collection('RealTime')
        .add({'name': '$name', 'pass': '$pass'}).whenComplete(() {
      nameController.clear();
      passController.clear();
    });
  }
}

class UploadedState extends GetxController {
  StreamController streamController = StreamController();

  // the path from where our data will be fetched and displayed to used
  Stream<QuerySnapshot> doc =
      FirebaseFirestore.instance.collection("data").snapshots();

   void StartStream() {
    doc.listen((event) {
      // here count is a field name in firestore database
      streamController.sink.add(event);
    });
  }

  @override
  FutureOr onClose() {
    streamController.close();
  }
}
