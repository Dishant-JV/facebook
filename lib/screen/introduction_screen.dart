import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../main.dart';

class IntroductionScreens extends StatefulWidget {
  const IntroductionScreens({Key? key}) : super(key: key);

  @override
  _IntroductionScreenState createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreens> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: IntroductionScreen(
      done: Text("Done"),
      onDone: () {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Fb()));
      },
      showSkipButton: true,
      onSkip: () {},
      skip: Text("Skip"),
      skipColor: Colors.blue,
      next: Text("Next"),
      color: Colors.grey,
      dotsDecorator: DotsDecorator(
        activeColor: Colors.red,
        activeSize: Size(30, 30),
      ),
      pages: [
        PageViewModel(
          bodyWidget: Container(
            child: Text("This is body"),
          ),
          image: Image.network(
            "https://upload.wikimedia.org/wikipedia/commons/4/47/PNG_transparency_demonstration_1.png",
          ),
          title: "this is first page",
          // body: "Ohh",
        ),
        PageViewModel(title: "this is second page", body: "Ohh"),
        PageViewModel(title: "this is third page", body: "Ohh")
      ],
    ));
  }
}
