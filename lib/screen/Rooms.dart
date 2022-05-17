import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rooms extends StatefulWidget {
  const Rooms({Key? key}) : super(key: key);

  @override
  _RoomsState createState() => _RoomsState();
}

class _RoomsState extends State<Rooms> {
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
                    color: Colors.purple
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
                      width:70,
                      margin: EdgeInsets.only(top: 60),

                      child: Image.asset("assets/images/home_room.png",fit: BoxFit.fill,),
                    ),
                    Container(
                      child: Text(
                        "Create Rooms",
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
                        image: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/7/7e/Virat_Kohli.jpg"),
                        fit: BoxFit.cover)),
                height: 205,
                width: 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "Ram shah",
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
                        image: NetworkImage("https://pbs.twimg.com/media/ERGiVgLXsAACI6l.jpg"),
                        fit: BoxFit.cover)),
                height: 205,
                width: 112,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Text(
                        "Aiu Bachhan",
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
                        image: NetworkImage("https://starsunfolded.com/wp-content/uploads/2014/06/Priyanka-Chopra-33.jpg"),
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
