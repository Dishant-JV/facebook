import 'package:flutter/material.dart';

class ListViewDemo extends StatefulWidget {
  const ListViewDemo({Key? key}) : super(key: key);

  @override
  _ListViewDemoState createState() => _ListViewDemoState();
}

class _ListViewDemoState extends State<ListViewDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
          crossAxisCount: 2,
        scrollDirection: Axis.horizontal,
        mainAxisSpacing: 5,
      crossAxisSpacing: 5,
      children: List.generate(10, (index) => Container(
        height: 100,
        width: 100,
        color: Colors.grey,
        child: Center(
          child: Container(
                color: index % 2 == 0 ? Colors.black : Colors.orange,
              child: Text('index $index')),
        ),
      ))
      ),
    );
  }
}
