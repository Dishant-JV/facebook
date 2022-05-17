import 'package:flutter/material.dart';

import 'database_helper.dart';

class DatabaseDemo extends StatefulWidget {
  const DatabaseDemo({Key? key}) : super(key: key);

  @override
  _DatabaseDemoState createState() => _DatabaseDemoState();
}

class _DatabaseDemoState extends State<DatabaseDemo> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  // void insertData() async {
  //   Map<String, dynamic> row = {ReadyToShipHelper.: "Dishant"};
  //   final id = dbHelper.insert(row);
  //   print(id);
  // }

  final dbHelper = ReadyToShipHelper;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 100,
          ),
          ElevatedButton(
              onPressed: () async {
                // insertData();
              },
              child: Text("Insert")),
          ElevatedButton(
              onPressed: () async {
                // Future<List<Map<String, Object?>>>? fetch =
                // await DatabaseHelper.instance.queryall();
              },
              child: Text("Query")),
        ],
      ),
    );
  }
}
