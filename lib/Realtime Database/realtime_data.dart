import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RealTimeData extends StatefulWidget {
  const RealTimeData({Key? key}) : super(key: key);

  @override
  _RealTimeDataState createState() => _RealTimeDataState();
}

class _RealTimeDataState extends State<RealTimeData> {
  final databaseReference = FirebaseDatabase.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        SizedBox(
          height: 50,
        ),
        ElevatedButton(
          onPressed: () {
            uploadData();
          },
          child: Text("Upload"),
        ),
        ElevatedButton(
          onPressed: () {
            readData();
          },
          child: Text("Read"),
        ),
      ],
    ));
  }

  void uploadData() async {
    databaseReference.ref("User/123").set({
      'name': 'fenil ',
      'description': 'Boy',
    }).whenComplete(() => print("Done"));
  }

  void readData() {
    final snap =
        databaseReference.ref('fenil').onValue.listen((DatabaseEvent event) {
      print(event.snapshot.value);
    });
  }
}
