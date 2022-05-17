import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  const Notifications({Key? key}) : super(key: key);

  @override
  _NotificationState createState() => _NotificationState();
}

class _NotificationState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 6, left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Notifications",
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)),
                    child: Icon(Icons.search_rounded),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20, left: 15),
              child: Text(
                "New",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03787,
                  top: 15,
                  right: MediaQuery.of(context).size.width * 0.02651,
                  bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo4.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: MediaQuery.of(context).size.width * 0.168,
                        width: MediaQuery.of(context).size.width * 0.167,
                      ),
                      Container(
                        //height: MediaQuery.of(context).size.width*0.155,
                        margin: EdgeInsets.only(
                            left: MediaQuery.of(context).size.width * 0.03282,
                            top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              alignment: Alignment.topLeft,
                              width: MediaQuery.of(context).size.width * 0.655,
                              child: RichText(
                                text: TextSpan(
                                    text: "Rajnik Ratanpara",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 15,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: " invited you to like",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 15))
                                    ]),
                              ),
                            ),
                            Container(
                                margin: EdgeInsets.only(top: 2, bottom: 2),
                                child: Text(
                                  "instasurt.in",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 15),
                                )),
                            Text(
                              "1 hour ago",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(
                      top: 2,
                    ),
                    width: MediaQuery.of(context).size.width * 0.08,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 15, left: 15),
              child: Text(
                "Earlier",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.03787,
                  right: MediaQuery.of(context).size.width * 0.026515,
                  bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/demo5.jpg",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                          height: 65,
                          width: 65,
                          //height: MediaQuery.of(context).size.width * 0.168,
                          //width: MediaQuery.of(context).size.width * 0.167,
                        ),
                        Container(

                         // height: MediaQuery.of(context).size.width*0.155,
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.03282,
                              top: 2),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                color: Colors.red,
                               width: MediaQuery.of(context).size.width * 0.655,
                                child: RichText(
                                  text: TextSpan(
                                      text: "Priya makvana ",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.black,
                                        fontSize: 15,
                                      ),
                                      children: [
                                        TextSpan(
                                            text: "and 3 other friends ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontSize: 15)),
                                        TextSpan(
                                            text: "had birthday on october 12",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 15)),
                                      ]),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: MediaQuery.of(context).size.width*0.0062),
                                child: Text(
                                  "1 hour ago",
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.grey.shade700.withOpacity(0.8)),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(
                      top: 2,
                    ),
                    width: MediaQuery.of(context).size.width * 0.08,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo3.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 65,
                        width: 65,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 13, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Reminder:",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text: " Dhruv B",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                    TextSpan(
                                        text: " invited you to like",
                                        style: TextStyle(
                                            color: Colors.black, fontSize: 15))
                                  ]),
                            ),
                            Text(
                              "mr_kanudo_4524",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "12 Oct at 9:17 pm Declined",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo5.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 65,
                        width: 65,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 13, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Gopalbhai J. Mangroliya",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text: " posted on",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15))
                                  ]),
                            ),
                            Text(
                              "your timelime",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "10 Oct at 9:53 am",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo6.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 65,
                        width: 65,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 13, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("you have new friend suggestion :",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15)),
                            Text(
                              "Jaysukhbhai Vaghasiya",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "Sat at 10:09 am",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo7.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 65,
                        width: 65,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 13, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "jitubhai koladiya, hetal vaghasiya",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text: " and",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15))
                                  ]),
                            ),
                            Text(
                              "10 other posted on your timeline.",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "8 Oct 10:12 pm",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo2.JPG",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 65,
                        width: 65,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 13, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Manisha Mewada",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text: " and 3 other friends",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15))
                                  ]),
                            ),
                            Text(
                              "had birthdays on October 23.",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "Sat at 10:09 am",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15, right: 15, bottom: 15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo5.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 65,
                        width: 65,
                      ),
                      Container(
                        height: 60,
                        margin: EdgeInsets.only(left: 13, top: 2),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            RichText(
                              text: TextSpan(
                                  text: "Gopalbhai J. Mangroliya",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      color: Colors.black,
                                      fontSize: 15),
                                  children: [
                                    TextSpan(
                                        text: " posted on",
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontSize: 15))
                                  ]),
                            ),
                            Text(
                              "your timelime",
                              style: TextStyle(fontSize: 15),
                            ),
                            Text(
                              "10 Oct at 9:53 am",
                              style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.grey.shade700.withOpacity(0.8)),
                            )
                          ],
                        ),
                      ),
                    ],
                  )),
                  Container(
                    child: Icon(Icons.more_horiz_outlined),
                    margin: EdgeInsets.only(top: 2),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
