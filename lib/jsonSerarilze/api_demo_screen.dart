import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'api_model.dart';

class ApiDemoScreen extends StatefulWidget {
  const ApiDemoScreen({Key? key}) : super(key: key);

  @override
  _ApiDemoScreenState createState() => _ApiDemoScreenState();
}

class _ApiDemoScreenState extends State<ApiDemoScreen> {
  bool isLoad = true;
  List<ApiModel> lstUser = [];

  getData() async {
    final response =
        await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      setState(() {
        data.map((e) => lstUser.add(ApiModel.fromJson(e))).toList();
        isLoad = false;
      });
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: isLoad
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: lstUser.length,
              itemBuilder: (context, index) {
                ApiModel apiModel = lstUser[index];
                return Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    width: double.infinity,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "userid : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              apiModel.userId.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "id : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              apiModel.id.toString(),
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Text(
                              "title : ",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                            Expanded(
                              child: Text(
                                apiModel.title.toString(),
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    ));
  }
}
