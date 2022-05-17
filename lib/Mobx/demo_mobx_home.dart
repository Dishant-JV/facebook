import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '';
import 'demo_mobx.dart';

class DemooMobxHome extends StatefulWidget {
  const DemooMobxHome({Key? key}) : super(key: key);

  @override
  _DemooMobxHomeState createState() => _DemooMobxHomeState();
}

class _DemooMobxHomeState extends State<DemooMobxHome> {
  final data = DemoMobx();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 50,
          ),
          InkWell(
              onTap: () {
                data.increment();
              },
              child: Row(
                children: [
                  SizedBox(
                    width: 50,
                  ),
                  Icon(
                    Icons.add,
                    size: 50,
                  ),
                ],
              )),
          SizedBox(
            height: 50,
          ),
          Observer(builder: (_) {
            return Text(data.i.toString());
          })
        ],
      ),
    ));
  }
}
