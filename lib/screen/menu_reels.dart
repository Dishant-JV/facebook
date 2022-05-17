import 'package:flutter/material.dart';

import 'menu.dart';

class MenuReels extends StatefulWidget {
  const MenuReels({Key? key}) : super(key: key);

  @override
  _MenuReelsState createState() => _MenuReelsState();
}

class _MenuReelsState extends State<MenuReels> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage("https://cdn.siasat.com/wp-content/uploads/2021/06/Kiara-Advani.jpg"),fit: BoxFit.cover)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Container(
                          width: double.infinity,
                          height: 480,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Expanded(
                                  child:Row(
                                    children: [
                                      InkWell(
                                        onTap:(){
                                          Navigator.pop(context,MaterialPageRoute(builder: (context)=>Menu()));
                                        },
                                        child: Container(
                                          margin: EdgeInsets.only(top: 10,left: 10),
                                          child: Icon(Icons.arrow_back,color: Colors.white,),
                                        ),
                                      ),
                                    ],
                                  )
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10),
                                  height: 35,
                                  width: 35,
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.white70.withOpacity(0.2)
                                  ),
                                  child: Icon(Icons.camera_alt,color: Colors.white,size: 20,),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 10, right: 10,top: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: AssetImage(
                                          "assets/images/demo5.jpg",
                                        ),
                                        fit: BoxFit.cover),
                                    shape: BoxShape.circle,
                                  ),
                                  height: 35,
                                  width: 35,
                                ),
                              ],
                          ),
                        ),
                      ),
                      Container(
                        width: double.infinity,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70.withOpacity(0.2)
                              ),
                              child: Icon(Icons.thumb_up,color: Colors.white,size: 20,),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 20,top: 5,bottom: 15),
                              child: Text("3.3K",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70.withOpacity(0.2)
                              ),
                              child: Icon(Icons.chat_bubble_rounded,color: Colors.white,size: 20,),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 27,top: 5,bottom: 15),
                              child: Text("22",style: TextStyle(color: Colors.white),),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 15),
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70.withOpacity(0.2)
                              ),
                              child: Icon(Icons.share,color: Colors.white,size: 20,),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 27,top: 5,bottom: 15),
                              child: Text("50",style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Row(
                          children: [
                            Expanded(child: Row(children: [Container(
                              margin: EdgeInsets.only(left: 15,bottom: 20),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://m.media-amazon.com/images/I/51e0yf3ZP2L._SY450_.jpg"
                                    ),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                              height: 35,
                              width: 35,
                            ),
                              Expanded(
                                child: Container(
                                  margin: EdgeInsets.only(left: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        child: Text("Telugu heroens    Follow",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w500),),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 20),
                                        child: Text("Public    - short video",style: TextStyle(color: Colors.grey.shade300.withOpacity(0.9)),),
                                      )
                                    ],
                                  ),
                                ),
                              )],)),
                            Container(
                              margin: EdgeInsets.only(right: 15,bottom: 20),
                              height: 38,
                              width: 38,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.white70.withOpacity(0.2)
                              ),
                              child: Icon(Icons.more_horiz_outlined,color: Colors.white,size: 20,),
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ),
              ),
              Container(
                color: Colors.black,
                height: 50,
                width: double.infinity,
                child: Container(margin: EdgeInsets.only(left: 20,top: 15),child: Text("Add a comment",style: TextStyle(color: Colors.white54,fontSize: 16),)),
              )
            ],
          ),
        ),
      ),
    );
  }
}
