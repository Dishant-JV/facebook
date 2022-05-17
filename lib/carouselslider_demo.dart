import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CarouslesliderDemo extends StatefulWidget {
  const CarouslesliderDemo({Key? key}) : super(key: key);

  @override
  _CarouslesliderDemoState createState() => _CarouslesliderDemoState();
}

class _CarouslesliderDemoState extends State<CarouslesliderDemo> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          //height: double.infinity,
          child: CarouselSlider(
              items:
              [
                Container(
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(image: AssetImage("assets/images/demo3.jpg"),fit: BoxFit.cover)
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(image: AssetImage("assets/images/demo4.jpg"),fit: BoxFit.cover)
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(image: AssetImage("assets/images/demo5.jpg"),fit: BoxFit.cover)
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(image: AssetImage("assets/images/demo6.jpg"),fit: BoxFit.cover)
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(15),
                  height: 200,
                  width: 320,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18),
                      image: DecorationImage(image: AssetImage("assets/images/demo7.jpg"),fit: BoxFit.cover)
                  ),
                )
              ]
              , options: CarouselOptions(
                disableCenter: false,
                height: 300,
                enlargeCenterPage: true,
                autoPlay: true,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 1000),
               // viewportFraction: 0.8,
              )),
        ),
      ),
    );
  }
}
