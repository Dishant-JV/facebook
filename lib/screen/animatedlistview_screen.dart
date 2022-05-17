import 'package:flutter/material.dart';

class AnimatedlistviewScreen extends StatefulWidget {
  const AnimatedlistviewScreen({Key? key}) : super(key: key);

  @override
  _AnimatedlistviewScreenState createState() => _AnimatedlistviewScreenState();
}

class _AnimatedlistviewScreenState extends State<AnimatedlistviewScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListWheelScrollView(
          diameterRatio: 0.8,
          itemExtent: 200,
          children: [
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.pink,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.yellow,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.yellow,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.blue,
              margin: EdgeInsets.all(20),
            ),
            Container(
              color: Colors.red,
              margin: EdgeInsets.all(20),
            )
          ],
        ),
      ),
    );
  }
}
