
import 'package:facebook/fire_auth/login.dart';
import 'package:facebook/global/global.dart';
import 'package:facebook/main.dart';
import 'package:facebook/menu_group.dart';
import 'package:facebook/screen/person.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'menu_reels.dart';

class Menu extends StatefulWidget {
  final String? name;
  final String? url;
  const Menu({Key? key, this.name, this.url}) : super(key: key);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> {
  void initState() {
    // TODO: implement initState
    super.initState();
  }
    void logout()async{
      FirebaseAuth.instance.signOut();
      SharedPreferences prefs= await SharedPreferences.getInstance();
      prefs.setBool('isLoggedIn', false);
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>LogIn()), (route) => false);
    }
  bool isHelp=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: Colors.grey.withOpacity(0.1),
        child: Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Menu",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                  ),
                  Container(
                    height: 38,
                    width: 38,
                    child: Icon(Icons.search_rounded),
                  )
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2)))
              ),
              height: 70,
              margin: EdgeInsets.only(left: 15,right: 15),
              padding: EdgeInsets.only(top:15),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: NetworkImage(
                                Global.url??"",
                              ),
                              fit: BoxFit.cover),
                          shape: BoxShape.circle,
                        ),
                        height: 40,
                        width: 40,
                      ),
                      Container(
                        height: 40,
                        margin: EdgeInsets.only(left: 13),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(Global.name??"",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),
                            Text("See your profile",style: TextStyle(fontSize: 15,color: Colors.grey.shade700.withOpacity(0.9)),)
                          ],
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            Container(
                margin: EdgeInsets.only(left: 15,right: 15),
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.26,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                            child: Container(
                              margin: EdgeInsets.only(top: 12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    height:MediaQuery.of(context).size.width*0.0757,
                                    width: MediaQuery.of(context).size.width*0.0757,
                                    child: Image.asset("assets/images/menu_marketplace.png",fit: BoxFit.cover,),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                    child: Text("Marketplace",style: TextStyle(fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.width*0.042),),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text("7 New",style: TextStyle(color: Colors.grey.shade600.withOpacity(0.9),fontSize: MediaQuery.of(context).size.width*0.034),),
                                  )
                                ],
                              ),
                            )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuGroup()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 12),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        height:MediaQuery.of(context).size.width*0.0757,
                                        width: MediaQuery.of(context).size.width*0.0757,
                                        child: Image.asset("assets/images/home_group.png",fit: BoxFit.cover,),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                        child: Text("Groups",style: TextStyle(fontWeight: FontWeight.w500,fontSize: MediaQuery.of(context).size.width*0.042),),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 8),
                                      height:35,
                                      width: 40,
                                      child: Image.asset("assets/images/menu_save.png",fit: BoxFit.fitWidth,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: Text("Saved",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MenuReels()));
                                },
                                child: Container(
                                  margin: EdgeInsets.only(top: 2),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 6),
                                        height:45,
                                        width: 45,
                                        child: Image.asset("assets/images/home_reels.png",fit: BoxFit.cover,),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(bottom: 5,left: 15),
                                        child: Text("Reels",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:36,
                                      width: 38,
                                      child: Image.asset("assets/images/menu_game.png",fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("Games",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:27 ,
                                      width: 27,
                                      child: Icon(Icons.people_rounded,size: 30,color: Colors.blue,)
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("Nearby Friends",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:27 ,
                                      width: 27,
                                      child: Icon(Icons.data_usage_sharp,color: Colors.red,size: 26,)
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("COVID-19 Center",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>Fb(
                                index: 1,
                              )
                              ));
                            },
                            child: Container(
                              margin: EdgeInsets.only(top: 8),
                                height:MediaQuery.of(context).size.width*0.202,
                                width: MediaQuery.of(context).size.width*0.45,
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black12,width: 0.7),
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow:[
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      offset: Offset(1.7,1.7),
                                      blurRadius:5,
                                      spreadRadius:1.5,
                                    )
                                  ]
                              ),
                                child: Container(
                                  margin: EdgeInsets.only(top: 10),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 15),
                                        height:32,
                                        width: 32,
                                        child: Image.asset("assets/images/menu_friend.png",fit: BoxFit.cover,),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                        child: Text("Friends",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                      ),
                                    ],
                                  ),
                                )
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:27 ,
                                      width: 27,
                                      child: Image.asset("assets/images/menu_memory.png",fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("Memories",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:27 ,
                                      width: 27,
                                      child: Image.asset("assets/images/menu_page.png",fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("Pages",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:27 ,
                                      width: 27,
                                      child: Image.asset("assets/images/menu_event.png",fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("Events",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8),
                              height:MediaQuery.of(context).size.width*0.202,
                              width: MediaQuery.of(context).size.width*0.45,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12,width: 0.7),
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow:[
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    offset: Offset(1.7,1.7),
                                    blurRadius:5,
                                    spreadRadius:1.5,
                                  )
                                ]
                            ),
                              child: Container(
                                margin: EdgeInsets.only(top: 12),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(left: 15),
                                      height:30,
                                      width: 30,
                                      child: Image.asset("assets/images/menu_job.png",fit: BoxFit.cover,),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(top: 5,bottom: 5,left: 15),
                                      child: Text("Jobs",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                                    ),
                                  ],
                                ),
                              )
                          )
                        ],
                      ),
                    ),
                  ],
                )
            ),
            Container(
              height: 72,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 16,top: 22),
                width: double.infinity,
                height: 42,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text("See More",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            ),
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.3)))
              ),
              child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      setState(() {
                        isHelp=!isHelp;
                      });
                    },
                    child: Container(
                      height: 60,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20,right: 15),
                                    child: Icon(Icons.help_sharp,color: Colors.blueGrey.withOpacity(0.5),size: 35,),
                                  ),
                                  Container(
                                    child: Text("Help & Support",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            child: isHelp == true ? Icon(Icons.keyboard_arrow_up,color: Colors.grey.shade600,):
    Icon(Icons.keyboard_arrow_down,color: Colors.grey.shade600,),margin: EdgeInsets.only(right: 20),
                          ),
                        ],
                      ),
                    ),
                  ),
                  isHelp == true ? Container(
                    child: Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12,width: 0.7),
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(1.7,1.7),
                                  blurRadius:5,
                                  spreadRadius:1.5,
                                )
                              ]
                          ),
                          margin: EdgeInsets.only(left: 15,right: 15,),
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Icon(Icons.whatshot_rounded,color: Colors.grey.shade800.withOpacity(0.8),size: 24,),
                              ),
                              Container(
                                child: Text("Help Center",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12,width: 0.7),
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(1.7,1.7),
                                  blurRadius:5,
                                  spreadRadius:1.5,
                                )
                              ]
                          ),
                          margin: EdgeInsets.only(left: 15,right: 15,top: 7),
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Icon(Icons.all_inbox,color: Colors.grey.shade800.withOpacity(0.8),size: 24,),
                              ),
                              Container(
                                child: Text("Support Inbox",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12,width: 0.7),
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(1.7,1.7),
                                  blurRadius:5,
                                  spreadRadius:1.5,
                                )
                              ]
                          ),
                          margin: EdgeInsets.only(left: 15,right: 15,top: 7),
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 8),
                                child: Icon(Icons.report_gmailerrorred_rounded,color: Colors.grey.shade800.withOpacity(0.8),size: 26,),
                              ),
                              Container(
                                child: Text("Report a Problem",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12,width: 0.7),
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(1.7,1.7),
                                  blurRadius:5,
                                  spreadRadius:1.5,
                                )
                              ]
                          ),
                          margin: EdgeInsets.only(left: 15,right: 15,top: 7),
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 10),
                                child: Icon(Icons.safety_divider,color: Colors.grey.shade800.withOpacity(0.8),size: 24,),
                              ),
                              Container(
                                child: Text("Safety",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                              )
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black12,width: 0.7),
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow:[
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  offset: Offset(1.7,1.7),
                                  blurRadius:5,
                                  spreadRadius:1.5,
                                )
                              ]
                          ),
                          margin: EdgeInsets.only(left: 15,right: 15,top: 7,bottom: 10),
                          height: 60,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Container(
                                margin: EdgeInsets.only(left: 10,right: 8),
                                child: Icon(Icons.rule_sharp,color: Colors.grey.shade800.withOpacity(0.8),size: 24,),
                              ),
                              Container(
                                child: Text("Terms & Policies",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 17),),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ) : Container(),
                ],
              )
            ),
            Container(
              height:54,
              width: double.infinity,
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 15),
                            child: Icon(Icons.settings,color: Colors.blueGrey.withOpacity(0.5),size: 35,),
                          ),
                          Container(
                            child: Text("Settings & Privacy",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17.5),),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(child: Icon(Icons.keyboard_arrow_down,color: Colors.grey.shade600,),margin: EdgeInsets.only(left: 15,right: 15),)
                ],
              ),
            ),
            InkWell(
              onTap: (){
                logout();
              },
              child: Container(
                margin: EdgeInsets.all(15),
                height: 34,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.withOpacity(0.3),
                ),
                alignment: Alignment.center,
                child: Text("Log Out",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
