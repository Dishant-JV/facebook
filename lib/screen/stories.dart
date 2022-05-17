import 'package:facebook/show_story_images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../show_images.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  _StoriesState createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
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
                        border: Border.all(color: Colors.grey.withOpacity(0.5))
                    ),
                    height: 205,
                    width: 112,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 140,
                          width: 112,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topRight: Radius.circular(12),topLeft: Radius.circular(12)),
                            image: new DecorationImage(
                              image: AssetImage(
                                "assets/images/demo6.jpg",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        )
                        ,Container(
                          child: Text(
                            "Create Story",
                            style: TextStyle(
                                fontSize: 13, fontWeight: FontWeight.w500),
                          ),
                          margin: EdgeInsets.only(bottom: 5),
                        )
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>StoryImages(
                        sImages:"https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg" ,
                        pImages: "assets/images/demo4.jpg",
                      )
                      ));
                    },
                    child: Container(
                      margin: EdgeInsets.only(right: 6),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.pink,
                          image: new DecorationImage(
                              image: NetworkImage("https://vinusimages.co/wp-content/uploads/2018/10/EG7A2390.jpgA_.jpg"),
                              fit: BoxFit.cover)),
                      height: 205,
                      width: 112,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(
                                    "assets/images/demo4.jpg",
                                  ),
                                  fit: BoxFit.cover),
                              shape: BoxShape.circle,
                            ),
                            height: 35,
                            width: 35,
                          ),
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
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.pink,
                        image: new DecorationImage(
                            image: NetworkImage("https://www.shaadidukaan.com/vogue/wp-content/uploads/2019/08/hug-kiss-images.jpg"),
                            fit: BoxFit.cover)),
                    height: 205,
                    width: 112,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/demo4.jpg",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                          height: 35,
                          width: 35,
                        ),
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
                            image: AssetImage("assets/images/demo7.jpg"),
                            fit: BoxFit.cover)),
                    height: 205,
                    width: 112,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10, left: 10),
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/demo4.jpg",
                                ),
                                fit: BoxFit.cover),
                            shape: BoxShape.circle,
                          ),
                          height: 35,
                          width: 35,
                        ),
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
