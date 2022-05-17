import 'package:facebook/screen/menu.dart';
import 'package:facebook/show_images.dart';
import 'package:flutter/material.dart';

class MenuGroup extends StatefulWidget {
  const MenuGroup({Key? key}) : super(key: key);

  @override
  _MenuGroupState createState() => _MenuGroupState();
}

class _MenuGroupState extends State<MenuGroup> {
  bool like=false;
  int cancel =0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 15,left: 15,right: 15),
                child: Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.pop(context, MaterialPageRoute(builder: (context)=>Menu(
                          )
                          ));
                        });
                      },
                      child: Container(
                        child: Icon(Icons.arrow_back,size: 27,),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.center,
                        child: Text("Groups",style: TextStyle(fontWeight: FontWeight.w700,fontSize: 18),),
                      ),
                    ),
                    Container(
                      child: Icon(Icons.add_box,size: 27,),
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 15),
                      child: Icon(Icons.settings,size: 27,),
                    ),
                    Container(
                      child: Icon(Icons.search,size: 27,),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, bottom: 15),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 10),
                      height: 35,
                      width: 130,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey.withOpacity(0.3)
                      ),
                      child: Row(
                        children: [Container(
                          margin: EdgeInsets.only(left: 5,right: 5),
                          child: Icon(Icons.person,size: 22,),
                        ),
                        Container(
                          child: Text("Your Groups",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        )],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      height: 35,
                      width: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.3)
                      ),
                      child: Row(
                        children: [Container(
                          margin: EdgeInsets.only(left: 10,right: 5),
                          child: Icon(Icons.local_convenience_store_rounded,size: 20,),
                        ),
                          Container(
                            child: Text("Discover",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          )],
                      ),
                    ),
                    Container(
                      height: 35,
                      width: 100,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.grey.withOpacity(0.3)
                      ),
                      child: Row(
                        children: [Container(
                          margin: EdgeInsets.only(left: 10,right: 5),
                          child: Icon(Icons.mail_sharp,size: 22,),
                        ),
                          Container(
                            child: Text("Invites",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          )],
                      ),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Container(
                  padding: EdgeInsets.only(bottom: 10),
                  decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.4),width: 8))
                  ),
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 15),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(image: AssetImage("assets/images/demo3.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage("assets/images/demo4.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage("assets/images/demo5.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            image: DecorationImage(image: AssetImage("assets/images/demo6.jpg"),fit: BoxFit.cover)
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 13,bottom: 8),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Row(
                              children: [
                                Stack(
                                  alignment: Alignment.bottomRight,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 10, right: 10,bottom: 2),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/demo5.jpg",
                                            ),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(15)
                                      ),
                                      height: 42,
                                      width: 42,
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(right: 9),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(
                                              "assets/images/demo7.jpg",
                                            ),
                                            fit: BoxFit.cover),
                                        shape: BoxShape.circle,
                                        border: Border.all(color: Colors.white)
                                      ),
                                      height: 30,
                                      width: 30,
                                    ),  
                                  ],
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 1),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text(
                                          "All Indian Wholsale Bazar",
                                          style: TextStyle(
                                              fontWeight: FontWeight.w700, fontSize: 16),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 2),
                                        child: Text(
                                          "Koba Rebekah Tessa Stratton",
                                          style: TextStyle(
                                              color: Colors.black12.withOpacity(0.6),
                                              fontSize: 13,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      )
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              showModalBottomSheet(isScrollControlled: true,context: context, builder:(BuildContext context)
                              {
                                return Container(
                                  height: 505,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 15),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.bookmark_outline,size: 32,color: Colors.grey.shade700.withOpacity(0.8)),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Save Post",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w500,),),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text("Add this to your saves items",style: TextStyle(fontSize: 12.5,color: Colors.grey.shade700.withOpacity(0.8)),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.star_border_purple500_outlined,size: 32,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Add Prakash Mangroliya to Favourite",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text("Prioritize his post in new feed",style: TextStyle(fontSize: 12.5,color: Colors.grey.shade700.withOpacity(0.8)),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.cancel_presentation_outlined,size: 28,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 10),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Hide Posts",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text("fewer hide post like this",style: TextStyle(fontSize: 12.5,color: Colors.grey.shade700.withOpacity(0.8)),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.watch_later_outlined,size: 32,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Sonooze Mangroliya for 30 days",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text("Temporary stop seeing posts",style: TextStyle(fontSize: 12.5,color: Colors.grey.shade700.withOpacity(0.8)),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.cancel_rounded,size: 32,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Unfollow Mangroliya",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text("Stop seeing post but stay friends",style: TextStyle(fontSize: 12.5,color: Colors.grey.shade700.withOpacity(0.8)),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.radio_button_checked_outlined,size: 32,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Why am i seeing this post",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.mark_chat_read_outlined,size: 29,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 9),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Find support for report this post",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                  Container(
                                                    margin: EdgeInsets.only(top: 2),
                                                    child: Text("I am concerned about this post",style: TextStyle(fontSize: 12.5,color: Colors.grey.shade700.withOpacity(0.8)),),
                                                  )
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.notifications_active_outlined,size: 32,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Turn on notification for this post",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 10,top: 20),
                                        child: Row(
                                          children: [
                                            Container(
                                              child: Icon(Icons.link,size: 32,color: Colors.grey.shade700.withOpacity(0.8),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 7),
                                              width: 330,
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    child: Text("Copy Post",style: TextStyle(fontSize: 17,fontWeight: FontWeight.w400),),
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
                            onTap: (){
                              setState(() {
                                cancel =1;
                              });
                            },
                            child: Container(
                                margin: EdgeInsets.only(right: 13, left: 20, top: 4),
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
                    Container(
                      margin: EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            child: Text("Eat Delicious Fruits In The Vast Garden",style: TextStyle(fontSize: 16),),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 5),
                            child: Icon(Icons.motion_photos_on_sharp,color: Colors.red,size: 20,),
                          )
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: (){
                        setState(() {
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Images(
                            img:"https://wikibio.in/wp-content/uploads/2017/12/Janhvi-Kapoor.jpg" ,
                          )
                          ));
                        });
                      },
                      child: Container(
                          width: double.infinity,
                          height: 370,
                          child: Image.network("https://wikibio.in/wp-content/uploads/2017/12/Janhvi-Kapoor.jpg",fit: BoxFit.cover,)),
                    ),
                    Container(
                      height: 45,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 10,right: 2),
                            child: Image.asset("assets/images/home_like.png",height: 20,width: 20,),
                          ),
                          Container(
                            child: Text("Hardik Undhad and 29 others                           1 Comment",style: TextStyle(color: Colors.black12.withOpacity(0.6)),),
                          )
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                            bottom: BorderSide(
                                color: Colors.grey.withOpacity(0.6), width: 13),
                            top:BorderSide(
                              color: Colors.grey.withOpacity(0.6),
                            )
                        ),
                      ),
                      height: 58,
                      width: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: InkWell(
                              onTap: (){
                                setState(() {
                                  like=!like;
                                });
                              },
                              child: Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 45,
                                      margin: EdgeInsets.only(bottom: 4,right: 5),
                                      child:  Image.asset("assets/images/home_greylike.png",
                                          height: 21,width: 21,color: like == true ? Colors.blue : Colors.black),
                                    ),
                                    Container(
                                      child: Text("Like",style: TextStyle(color: like == true ? Colors.blue : Colors.black12.withOpacity(0.6)),),
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
                                    child:  Image.asset("assets/images/home_comment.png",
                                      height: 21,width: 21,),
                                  ),
                                  Container(
                                    child: Text("Cooment" ,style: TextStyle(color: Colors.black12.withOpacity(0.6))),
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
                                    child:  Image.asset("assets/images/home_share.png",
                                      height: 23,width: 23,),
                                  ),
                                  Container(
                                    child: Text("Share",style: TextStyle(color: Colors.black12.withOpacity(0.6))),
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
            ],
          ),
        ),
      ),
    );
  }
}
