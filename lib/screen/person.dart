import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Person extends StatefulWidget {
  const Person({Key? key}) : super(key: key);

  @override
  _PersonState createState() => _PersonState();
}

class _PersonState extends State<Person> {
  int index =0;
  int bIndex=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Friends",
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    margin: EdgeInsets.only(top:12,left: 15),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 15,top: 7),
                    height: 38,
                    width: 38,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey.withOpacity(0.1)
                    ),
                    child: Icon(Icons.search_rounded),
                  )
                ],
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(bottom: BorderSide(
                        color: Colors.grey.withOpacity(0.3)
                    ))
                ),
                margin: EdgeInsets.only(top: 8),
                padding: EdgeInsets.only(bottom: 16),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 15,right: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.grey.withOpacity(0.3),
                      ),
                      alignment: Alignment.center,
                      height: 34,
                      width: MediaQuery.of(context).size.width*0.26,

                      child: Text("Suggestions",style: TextStyle(fontWeight: FontWeight.w600),),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(17),
                        color: Colors.grey.withOpacity(0.3),

                      ),
                      alignment: Alignment.center,
                      height: 34,
                      width: MediaQuery.of(context).size.width*0.24,

                      child: Text("All Friends",style: TextStyle(fontWeight: FontWeight.w600
                      ),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 15),
                child: Row(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 15,right: 7),
                            child: Text("Friend Requests",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          ),
                          Container(
                            child: Text("55",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.red),),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 15),
                      child: Text("See All",style: TextStyle(color: Colors.blueAccent.withOpacity(0.9),fontSize: 17),),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 16),
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
                      height: MediaQuery.of(context).size.width*0.223,
                      width: MediaQuery.of(context).size.width*0.223,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width:MediaQuery.of(context).size.width*0.706,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Krish Bhanderi",style: TextStyle(fontWeight: FontWeight.w600,fontSize:17),),
                                ),
                                index == 0 ?  Container(child: Text("13w",style: TextStyle(color: Colors.black12.withOpacity(0.4),fontSize: 14),),margin: EdgeInsets.only(right: 5),) : Container(),
                              ],
                            ),
                          ),
                          index == 0 ? Container(
                            child: Column(
                              children: [
                                Container(
                                  width:MediaQuery.of(context).size.width*0.72,
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(top: 5,bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                        height: 20,
                                        width: 20,
                                        margin: EdgeInsets.only(right: 7),
                                      ),
                                      Text("6 mutual friends",style: TextStyle(color: Colors.black12.withOpacity(0.6)),)
                                    ],
                                  ),
                                ),
                                Container(
                                  child: Row(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          setState(() {
                                            index =1;
                                          });
                                        },
                                        child: Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5),
                                            color: Colors.blue.shade700,
                                          ),
                                          alignment: Alignment.center,
                                          height: 33,
                                          width: MediaQuery.of(context).size.width*0.335,

                                          child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 8,right: 8),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Colors.grey.withOpacity(0.3),
                                        ),
                                        alignment: Alignment.center,
                                        height: 33,
                                        width: MediaQuery.of(context).size.width*0.335,

                                        child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w600,),),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ) : Container(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top:5),
                                  child: Text("Now you are friend",style: TextStyle(color:Colors.grey.shade600.withOpacity(0.9),fontWeight: FontWeight.w400),),
                                )
                              ],
                            ),
                          )

                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/demo2.JPG",
                            ),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                      height: 85,
                      width: 85,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 286,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Raj Makk",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                                Container(child: Text("23w",style: TextStyle(color: Colors.black12.withOpacity(0.4)),),margin: EdgeInsets.only(right: 10),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 10),
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
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(right: 7),
                                ),
                                Text("6 mutual friends",style: TextStyle(color: Colors.black12.withOpacity(0.6)),)
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade700,
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w600,),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/demo3.jpg",
                            ),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                      height: 85,
                      width: 85,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 286,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Kanji Bhalala",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                                Container(child: Text("1y",style: TextStyle(color: Colors.black12.withOpacity(0.4)),),margin: EdgeInsets.only(right: 10),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 10),
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
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(right: 7),
                                ),
                                Text("12 mutual friends",style: TextStyle(color: Colors.black12.withOpacity(0.6)),)
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade700,
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w600,),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
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
                      height: 85,
                      width: 85,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 286,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Bansi savani",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                                Container(child: Text("2y",style: TextStyle(color: Colors.black12.withOpacity(0.4)),),margin: EdgeInsets.only(right: 10),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 10),
                            child: Row(
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
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(right: 7),
                                ),
                                Text("62 mutual friends",style: TextStyle(color: Colors.black12.withOpacity(0.6)),)
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade700,
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w600,),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18),
                child: Row(
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
                      height: 85,
                      width: 85,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 286,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Perin Aeklara",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                                Container(child: Text("2y",style: TextStyle(color: Colors.black12.withOpacity(0.4)),),margin: EdgeInsets.only(right: 10),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 10),
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
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(right: 7),
                                ),
                                Text("6 mutual friends",style: TextStyle(color: Colors.black12.withOpacity(0.6)),)
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade700,
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w600,),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18,bottom: 18),
                child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                              "assets/images/demo2.JPG",
                            ),
                            fit: BoxFit.cover),
                        shape: BoxShape.circle,
                      ),
                      height: 85,
                      width: 85,
                    ),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 286,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text("Isha jariwala",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 17),),
                                ),
                                Container(child: Text("5y",style: TextStyle(color: Colors.black12.withOpacity(0.4)),),margin: EdgeInsets.only(right: 10),),
                              ],
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 5,bottom: 10),
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
                                  height: 20,
                                  width: 20,
                                  margin: EdgeInsets.only(right: 7),
                                ),
                                Text("6 mutual friends",style: TextStyle(color: Colors.black12.withOpacity(0.6)),)
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.blue.shade700,
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Confirm",style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white),),
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Colors.grey.withOpacity(0.3),
                                  ),
                                  alignment: Alignment.center,
                                  height: 33,
                                  width: 135,

                                  child: Text("Delete",style: TextStyle(fontWeight: FontWeight.w600,),),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    )
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
