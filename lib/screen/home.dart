import 'package:facebook/screen/Reels.dart';
import 'package:facebook/screen/Rooms.dart';
import 'package:facebook/screen/stories.dart';
import 'package:facebook/show_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool visible = true;
  @override
  int currentindex = 0;
  bool like = false;
  List<Widget> pageList = [Stories(), Reels(), Rooms()];
  int index = 0;
  int cancel = 0;

  Widget build(BuildContext context) {
    return Container(
        child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
              height: 84,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/demo4.jpg",
                          ),
                          fit: BoxFit.cover),
                      shape: BoxShape.circle,
                    ),
                    height: 42,
                    width: 42,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: Colors.grey.withOpacity(0.4), width: 1.5),
                        borderRadius: BorderRadius.circular(35)),
                    height: 60,
                    width: MediaQuery.of(context).size.width * 0.68,
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 10),
                      child: Text(
                        "Write something here....",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: 10),
                    height: 35,
                    width: 35,
                    child: Image.asset("assets/images/imagestwo.png"),
                  ),
                ],
              )),
          Container(
            color: Colors.grey.withOpacity(0.11),
            height: 58,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Image.asset(
                        "assets/images/home_reels.png",
                        fit: BoxFit.cover,
                        height: 38,
                        width: MediaQuery.of(context).size.width * 0.099,
                      )),
                      Container(
                        child: Text(
                          "Reel",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width * 0.033),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          child: Image.asset(
                        "assets/images/home_room.png",
                        fit: BoxFit.fitWidth,
                        height: 40,
                        width:MediaQuery.of(context).size.width * 0.095
                      )),
                      Container(
                        child: Text(
                          "Room",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width*0.033),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 5, right: 9),
                          child: Image.asset(
                            "assets/images/home_group.png",
                            fit: BoxFit.fitWidth,
                            height: 23,
                            width: MediaQuery.of(context).size.width * 0.055,
                          )),
                      Container(
                        child: Text(
                          "Photo",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width * 0.033),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: 32,
                  width: MediaQuery.of(context).size.width * 0.20,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.grey.withOpacity(0.3)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          margin: EdgeInsets.only(left: 7),
                          child: Image.asset(
                            "assets/images/home_live.png",
                            fit: BoxFit.fitWidth,
                            height: 30,
                            width: MediaQuery.of(context).size.width * 0.075,
                          )),
                      Container(
                        margin: EdgeInsets.only(left: 5),
                        child: Text(
                          "Live",
                          style: TextStyle(
                              fontWeight: FontWeight.w500, fontSize: MediaQuery.of(context).size.width * 0.033),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Container(
              child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 11, left: 25),
                child: Row(
                  children: [
                    currentindex == 0
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue.shade200.withOpacity(0.5)),
                              alignment: Alignment.center,
                              height: 32,
                              width: 65,
                              child: Text(
                                "Stories",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 0;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              alignment: Alignment.center,
                              height: 32,
                              width: 65,
                              child: Text(
                                "Stories",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Colors.grey.shade700.withOpacity(0.8)),
                              ),
                            ),
                          ),
                    currentindex == 1
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue.shade200.withOpacity(0.5)),
                              height: 32,
                              width: 55,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "Reels",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 1;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 32,
                              width: 55,
                              alignment: Alignment.center,
                              margin: EdgeInsets.only(left: 5, right: 5),
                              child: Text(
                                "Reels",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Colors.grey.shade700.withOpacity(0.8)),
                              ),
                            ),
                          ),
                    currentindex == 2
                        ? InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 2;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.blue.shade200.withOpacity(0.5)),
                              height: 32,
                              width: 63,
                              alignment: Alignment.center,
                              child: Text(
                                "Rooms",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.blue),
                              ),
                            ),
                          )
                        : InkWell(
                            onTap: () {
                              setState(() {
                                currentindex = 2;
                              });
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                              ),
                              height: 32,
                              width: 63,
                              alignment: Alignment.center,
                              child: Text(
                                "Rooms",
                                style: TextStyle(
                                    fontSize: 15.5,
                                    fontWeight: FontWeight.w500,
                                    color:
                                        Colors.grey.shade700.withOpacity(0.8)),
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              Container(
                child: pageList[currentindex],
              )
            ],
          )),
          cancel == 0
              ? Container(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 13, bottom: 13),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Row(
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                            "assets/images/demo5.jpg",
                                          ),
                                          fit: BoxFit.cover),
                                      shape: BoxShape.circle,
                                    ),
                                    height: 42,
                                    width: 42,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 1),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text(
                                            "Prakash Mangroliya",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w700,
                                                fontSize: 16),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 2),
                                          child: Text(
                                            "Suggested for you . 1d . Junagadh",
                                            style: TextStyle(
                                                color: Colors.black12
                                                    .withOpacity(0.6),
                                                fontSize: 14,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showModalBottomSheet(
                                    isScrollControlled: true,
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Container(
                                        height: 505,
                                        child: Column(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 15),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                        Icons.bookmark_outline,
                                                        size: 32,
                                                        color: Colors
                                                            .grey.shade700
                                                            .withOpacity(0.8)),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Save Post",
                                                            style: TextStyle(
                                                              fontSize: 17,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500,
                                                            ),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Text(
                                                            "Add this to your saves items",
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .star_border_purple500_outlined,
                                                      size: 32,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Add Prakash Mangroliya to Favourite",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Text(
                                                            "Prioritize his post in new feed",
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .cancel_presentation_outlined,
                                                      size: 28,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 10),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Hide Posts",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Text(
                                                            "fewer hide post like this",
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .watch_later_outlined,
                                                      size: 32,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Sonooze Mangroliya for 30 days",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Text(
                                                            "Temporary stop seeing posts",
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons.cancel_rounded,
                                                      size: 32,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Unfollow Mangroliya",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Text(
                                                            "Stop seeing post but stay friends",
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .radio_button_checked_outlined,
                                                      size: 32,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Why am i seeing this post",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .mark_chat_read_outlined,
                                                      size: 29,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 9),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Find support for report this post",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                        Container(
                                                          margin:
                                                              EdgeInsets.only(
                                                                  top: 2),
                                                          child: Text(
                                                            "I am concerned about this post",
                                                            style: TextStyle(
                                                                fontSize: 12.5,
                                                                color: Colors
                                                                    .grey
                                                                    .shade700
                                                                    .withOpacity(
                                                                        0.8)),
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons
                                                          .notifications_active_outlined,
                                                      size: 32,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Turn on notification for this post",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(
                                                  left: 10, top: 20),
                                              child: Row(
                                                children: [
                                                  Container(
                                                    child: Icon(
                                                      Icons.link,
                                                      size: 32,
                                                      color: Colors
                                                          .grey.shade700
                                                          .withOpacity(0.8),
                                                    ),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(
                                                        left: 7),
                                                    width: 330,
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Container(
                                                          child: Text(
                                                            "Copy Post",
                                                            style: TextStyle(
                                                                fontSize: 17,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w400),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      );
                                    });
                              },
                              child: Container(
                                child: Icon(
                                  Icons.more_horiz,
                                  color: Colors.black12.withOpacity(0.5),
                                  size: 23,
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                setState(() {
                                  cancel = 1;
                                });
                              },
                              child: Container(
                                  margin: EdgeInsets.only(
                                      right: 13, left: 20, top: 4),
                                  height: 14,
                                  width: 14,
                                  child: Image.asset(
                                    "assets/images/home_cancel.png",
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Images(
                                          img:
                                              "https://wikibio.in/wp-content/uploads/2017/12/Janhvi-Kapoor.jpg",
                                        )));
                          });
                        },
                        child: Container(
                            width: double.infinity,
                            height: 300,
                            child: Image.network(
                              "https://wikibio.in/wp-content/uploads/2017/12/Janhvi-Kapoor.jpg",
                              fit: BoxFit.cover,
                            )),
                      ),
                      Container(
                        height: 45,
                        width: double.infinity,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10, right: 2),
                              child: Image.asset(
                                "assets/images/home_like.png",
                                height: 20,
                                width: 20,
                              ),
                            ),
                            Container(
                              child: Text(
                                "Hardik Undhad and 29 others                           1 Comment",
                                style: TextStyle(
                                    color: Colors.black12.withOpacity(0.6)),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: Colors.grey.withOpacity(0.6),
                                  width: 13),
                              top: BorderSide(
                                color: Colors.grey.withOpacity(0.6),
                              )),
                        ),
                        height: 58,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    like = !like;
                                  });
                                },
                                child: Container(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        height: 45,
                                        margin: EdgeInsets.only(
                                            bottom: 4, right: 5),
                                        child: Image.asset(
                                            "assets/images/home_greylike.png",
                                            height: 21,
                                            width: 21,
                                            color: like == true
                                                ? Colors.blue
                                                : Colors.black),
                                      ),
                                      Container(
                                        child: Text(
                                          "Like",
                                          style: TextStyle(
                                              color: like == true
                                                  ? Colors.blue
                                                  : Colors.black12
                                                      .withOpacity(0.6)),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Image.asset(
                                        "assets/images/home_comment.png",
                                        height: 21,
                                        width: 21,
                                      ),
                                    ),
                                    Container(
                                      child: Text("Cooment",
                                          style: TextStyle(
                                              color: Colors.black12
                                                  .withOpacity(0.6))),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                alignment: Alignment.center,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(right: 5),
                                      child: Image.asset(
                                        "assets/images/home_share.png",
                                        height: 23,
                                        width: 23,
                                      ),
                                    ),
                                    Container(
                                      child: Text("Share",
                                          style: TextStyle(
                                              color: Colors.black12
                                                  .withOpacity(0.6))),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              : Container(),
          Container(
            margin: EdgeInsets.only(top: 13, bottom: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo7.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 42,
                        width: 42,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Dishant Vaghasiya",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Text(
                                "Suggested for you . 2d",
                                style: TextStyle(
                                    color: Colors.black12.withOpacity(0.6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black12.withOpacity(0.5),
                    size: 23,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 13, left: 20, top: 4),
                    height: 14,
                    width: 14,
                    child: Image.asset(
                      "assets/images/home_cancel.png",
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 300,
              child: Image.network(
                "https://expertphotography.b-cdn.net/wp-content/uploads/2020/07/social-media-for-photographers-follow-1.jpg",
                fit: BoxFit.cover,
              )),
          Container(
            height: 45,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 2),
                  child: Image.asset(
                    "assets/images/home_like.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                Container(
                  child: Text(
                    "Suresh gadhiya and thousands of others       1 Comment",
                    style: TextStyle(color: Colors.black12.withOpacity(0.6)),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.6), width: 13),
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.6),
                  )),
            ),
            height: 58,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(right: 5, bottom: 4),
                        child: Image.asset(
                          "assets/images/home_greylike.png",
                          height: 21,
                          width: 21,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Like",
                          style:
                              TextStyle(color: Colors.black12.withOpacity(0.6)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          "assets/images/home_comment.png",
                          height: 21,
                          width: 21,
                        ),
                      ),
                      Container(
                        child: Text("Cooment",
                            style: TextStyle(
                                color: Colors.black12.withOpacity(0.6))),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          "assets/images/home_share.png",
                          height: 23,
                          width: 23,
                        ),
                      ),
                      Container(
                        child: Text("Share",
                            style: TextStyle(
                                color: Colors.black12.withOpacity(0.6))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 13, bottom: 13),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                "assets/images/demo5.jpg",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 42,
                        width: 42,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 1),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Hari Aeklara",
                                style: TextStyle(
                                    fontWeight: FontWeight.w700, fontSize: 16),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Text(
                                "38d",
                                style: TextStyle(
                                    color: Colors.black12.withOpacity(0.6),
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Icon(
                    Icons.more_horiz,
                    color: Colors.black12.withOpacity(0.5),
                    size: 23,
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(right: 13, left: 20, top: 4),
                    height: 14,
                    width: 14,
                    child: Image.asset(
                      "assets/images/home_cancel.png",
                      fit: BoxFit.cover,
                    )),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              height: 300,
              child: Image.asset(
                "assets/images/demo2.JPG",
                fit: BoxFit.contain,
              )),
          Container(
            height: 45,
            width: double.infinity,
            child: Row(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 10, right: 2),
                  child: Image.asset(
                    "assets/images/home_like.png",
                    height: 20,
                    width: 20,
                  ),
                ),
                Container(
                  child: Text(
                    "Hardik Undhad and 29 others                           1 Comment",
                    style: TextStyle(color: Colors.black12.withOpacity(0.6)),
                  ),
                )
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      color: Colors.grey.withOpacity(0.6), width: 13),
                  top: BorderSide(
                    color: Colors.grey.withOpacity(0.6),
                  )),
            ),
            height: 58,
            width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Row(
                    children: [
                      Container(
                        height: 45,
                        margin: EdgeInsets.only(right: 5, bottom: 4),
                        child: Image.asset(
                          "assets/images/home_greylike.png",
                          height: 21,
                          width: 21,
                        ),
                      ),
                      Container(
                        child: Text(
                          "Like",
                          style:
                              TextStyle(color: Colors.black12.withOpacity(0.6)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          "assets/images/home_comment.png",
                          height: 21,
                          width: 21,
                        ),
                      ),
                      Container(
                        child: Text("Cooment",
                            style: TextStyle(
                                color: Colors.black12.withOpacity(0.6))),
                      )
                    ],
                  ),
                ),
                Container(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 5),
                        child: Image.asset(
                          "assets/images/home_share.png",
                          height: 23,
                          width: 23,
                        ),
                      ),
                      Container(
                        child: Text("Share",
                            style: TextStyle(
                                color: Colors.black12.withOpacity(0.6))),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
