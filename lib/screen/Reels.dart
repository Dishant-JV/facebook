import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Reels extends StatefulWidget {
  const Reels({Key? key}) : super(key: key);

  @override
  _ReelsState createState() => _ReelsState();
}

class _ReelsState extends State<Reels> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Container(
          decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                    color: Colors.grey.withOpacity(0.6), width: 13),
              )),
          padding: EdgeInsets.only(top: 11, bottom: 12),
          child: Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 6, right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    gradient: LinearGradient(
                       begin: Alignment.topCenter,
                       end: Alignment.bottomCenter,
                      stops: [0.5,1],
                      colors: [
                        Colors.pink.shade300,
                        Colors.yellow.shade300,
                      ]
                    )
                ),
                height: 205,
                width: 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle
                      ),
                      width:100,
                      margin: EdgeInsets.only(top: 60),

                      child: Image.asset("assets/images/home_reels.png"),
                    ),
                    Container(
                      child: Text(
                        "Create Reels",
                        style: TextStyle(color: Colors.white,
                            fontSize: 13, fontWeight: FontWeight.w500),
                      ),
                      margin: EdgeInsets.only(bottom: 5),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.pink,
                    image: new DecorationImage(
                        image: NetworkImage("https://www.goldenglobes.com/sites/default/files/articles/cover_images/shah_rukh_khan.jpg?format=pjpg&auto=webp&optimize=high&width=850"),
                        fit: BoxFit.cover)),
                height: 205,
                width: 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "Sonu jat",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      margin: EdgeInsets.only(bottom: 5, left: 7),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.pink,
                    image: new DecorationImage(
                        image: NetworkImage("https://media.architecturaldigest.in/wp-content/uploads/2020/08/Ananya-Panday-Mumbai-home-photos-7.png"),
                        fit: BoxFit.cover)),
                height: 205,
                width: 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "Karan yas",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      margin: EdgeInsets.only(bottom: 5, left: 7),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 6),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.pink,
                    image: new DecorationImage(
                        image: AssetImage("assets/images/demo5.jpg"),
                        fit: BoxFit.cover)),
                height: 205,
                width: 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    Container(
                      child: Text(
                        "Megal Pont",
                        style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w500,
                            color: Colors.white),
                      ),
                      margin: EdgeInsets.only(bottom: 5, left: 7),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
