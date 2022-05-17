import 'dart:core';

import 'package:flutter/material.dart';

class Images extends StatefulWidget {

  final String ? img;
  const Images({Key? key, this.img,}) : super(key: key);

  @override
  _ImagesState createState() => _ImagesState();
}

class _ImagesState extends State<Images> {
  @override
  String ? img;
  void initState() {
    // TODO: implement initState
    super.initState();
    img=widget.img;
  }
  int index =0;
  int bindex =0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                child: Image.network(
                    img??""
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                border: Border(
                    top:BorderSide(
                      color: Colors.grey.withOpacity(0.4),
                    )
                ),
              ),
              height: 50,
              width: 370,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: (){
                        setState(() {
                          index =1;
                          bindex =1;
                        });
                      },
                      child: index == 0 ? Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 45,
                              margin: EdgeInsets.only(bottom: 4,right: 5),
                              child:  Image.asset("assets/images/home_greylike.png",
                                height: 21,width: 21,color: Colors.white,),
                            ),
                            Container(
                              child: Text("Like",style: TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      ) : InkWell(
                        onTap: (){
                          setState(() {
                            index =0;
                          });
                        },
                        child: index == 1 ? Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(bottom: 4,right: 5),
                                child:  Image.asset("assets/images/home_greylike.png",
                                  height: 21,width: 21,color: Colors.blue,),
                              ),
                              Container(
                                child: Text("Like",style: TextStyle(color: Colors.blue),),
                              )
                            ],
                          ),
                        ) : Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 45,
                                margin: EdgeInsets.only(bottom: 4,right: 5),
                                child:  Image.asset("assets/images/home_greylike.png",
                                    height: 21,width: 21),
                              ),
                              Container(
                                child: Text("Like",style: TextStyle(color: Colors.white),),
                              )
                            ],
                          ),
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
                              height: 21,width: 21,color: Colors.white,),
                          ),
                          Container(
                            child: Text("Cooment" ,style: TextStyle(color: Colors.white)),
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
                              height: 23,width: 23,color: Colors.white,),
                          ),
                          Container(
                            child: Text("Share",style: TextStyle(color: Colors.white)),
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
    );
  }
}
