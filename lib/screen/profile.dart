import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned.fill(child: Container(
                )),
                Container(
                  decoration: BoxDecoration(
                    image: new DecorationImage(
                        image: NetworkImage("https://images.unsplash.com/photo-1457449940276-e8deed18bfff?ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8cHJvZmlsZXxlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",),fit: BoxFit.fill),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                  ),
                  margin: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 75),
                  height: 200,
                  width: double.infinity,
                ),
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(
                          "assets/images/demo4.jpg",
                        ),
                        fit: BoxFit.cover),
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white,width: 6)
                  ),
                  height: 150,
                  width: 150,
                ),
              ],
            ),

            Container(
              margin: EdgeInsets.only(bottom:16 ),
              child: Text("Dishant Vaghasiya",style: TextStyle(fontSize: 27,fontWeight: FontWeight.w500),),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                      bottom:
                      BorderSide(color: Colors.grey.withOpacity(0.2)))),
              padding: EdgeInsets.only(bottom: 17),
              width: double.infinity,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 35,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade600,
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.star,
                          size: 19,
                          color: Colors.white,
                        ),
                        Container(
                          child: Text(
                            "Add to Story",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15,color: Colors.white),
                          ),
                          margin: EdgeInsets.only(left: 5),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 35,
                    width: 145,
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          size: 18,
                        ),
                        Container(
                          child: Text(
                            "Edit Profile",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 15),
                          ),
                          margin: EdgeInsets.only(left: 5),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(5)),
                    height: 35,
                    width: 50,
                   child: Icon(Icons.more_horiz_sharp),
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 10),
                    child: Icon(Icons.home,color: Colors.grey.shade600.withOpacity(0.8),size: 28,),
                  ),
                  Text("Current City",style: TextStyle(color: Colors.grey.shade600.withOpacity(0.8),fontSize: 17),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 13),
                    child: Icon(Icons.home_work_sharp,color: Colors.grey.shade600.withOpacity(0.8),size: 25,),
                  ),
                  Text("Workspace",style: TextStyle(color: Colors.grey.shade600.withOpacity(0.8),fontSize: 17),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 10),
                    child: Icon(Icons.school,color: Colors.grey.shade600.withOpacity(0.8),size: 28,),
                  ),
                  Text("School",style: TextStyle(color: Colors.grey.shade600.withOpacity(0.8),fontSize: 17),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 10),
                    child: Icon(Icons.location_on,color: Colors.grey.shade600.withOpacity(0.8),size: 28,),
                  ),
                  Text("Hometown",style: TextStyle(color: Colors.grey.shade600.withOpacity(0.8),fontSize: 17),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 10),
                    child: Icon(Icons.favorite,color: Colors.grey.shade600.withOpacity(0.8),size: 26,),
                  ),
                  Text("Relationship Status",style: TextStyle(color: Colors.grey.shade600.withOpacity(0.8),fontSize: 17),)
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 15,right: 10),
                    child: Icon(Icons.more_horiz_rounded,size: 26,color: Colors.grey.shade600.withOpacity(0.8),),
                  ),
                  Text("See Your About Info",style: TextStyle(fontSize: 17),)
                ],
              ),
            ),
            Container(
              height: 70,
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.2)))
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(18),
                //padding: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                  color: Colors.blue.shade100.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Text("Edit Public Details",style: TextStyle(color: Colors.blue.shade800,fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Friends",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 21),),
                  Text("Find Friends",style: TextStyle(color: Colors.blue.shade600,fontWeight: FontWeight.w500,fontSize: 16),),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12,left: 12,top: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.293,
                          width: MediaQuery.of(context).size.width*0.293,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: new DecorationImage(image: AssetImage("assets/images/demo2.JPG"),fit:BoxFit.cover)
                          ),
                        ),
                        Container(child: Text("Lalji Narola",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                        margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.293,
                          width: MediaQuery.of(context).size.width*0.293,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: new DecorationImage(image: AssetImage("assets/images/demo4.jpg"),fit:BoxFit.cover)
                          ),
                        ),
                        Container(child: Text("Utsav Savani",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.293,
                          width: MediaQuery.of(context).size.width*0.293,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: new DecorationImage(image: AssetImage("assets/images/demo3.jpg"),fit:BoxFit.cover)
                          ),
                        ),
                        Container(child: Text("Sandip Patel",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(right: 12,left: 12,top: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.293,
                          width: MediaQuery.of(context).size.width*0.293,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: new DecorationImage(image: AssetImage("assets/images/demo5.jpg"),fit:BoxFit.cover)
                          ),
                        ),
                        Container(child: Text("Jenil Patel",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.293,
                          width: MediaQuery.of(context).size.width*0.293,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: new DecorationImage(image: AssetImage("assets/images/demo6.jpg"),fit:BoxFit.cover)
                          ),
                        ),
                        Container(child: Text("Amit Yadav",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),)
                      ],
                    ),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.293,
                          width: MediaQuery.of(context).size.width*0.293,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              image: new DecorationImage(image: AssetImage("assets/images/demo7.jpg"),fit:BoxFit.cover)
                          ),
                        ),
                        Container(child: Text("Harsh Vora",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 16),),
                          margin: EdgeInsets.only(left: 5,top: 8,bottom: 8),)
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: 75,
              decoration: BoxDecoration(
                  border: Border(bottom: BorderSide(color: Colors.grey.withOpacity(0.9),width: 10))
              ),
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 15,right: 15,bottom: 22,top: 8),
                //padding: EdgeInsets.only(bottom: 15),
                width: double.infinity,
                height: 35,
                decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(8)
                ),
                child: Text("See All Friends",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15),),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
