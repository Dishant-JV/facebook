import 'package:flutter/material.dart';

class StoryImages extends StatefulWidget {
  final String ?sImages;
  final String ?pImages;
  const StoryImages({Key? key, this.sImages, this.pImages}) : super(key: key);

  @override
  _StoryImagesState createState() => _StoryImagesState();
}

class _StoryImagesState extends State<StoryImages> {
  String ?sImages;
  String ? pImages;
  void initState() {
    // TODO: implement initState
    super.initState();
    sImages=widget.sImages;
    pImages=widget.pImages;
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          child: Container(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40,bottom: 13),
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
                                    image: AssetImage(pImages!),
                                    fit: BoxFit.cover),
                                shape: BoxShape.circle,
                              ),
                              height: 42,
                              width: 42,
                            ),
                            Container(
                              height: 40,
                              padding: EdgeInsets.only(top: 10),
                              margin: EdgeInsets.only(left:1),
                              child: Container(
                                child: Text(
                                  "Prakash Mangroliya",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 16,color: Colors.white),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        child: Icon(
                          Icons.more_horiz,
                          color: Colors.white,
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
                            color: Colors.white,
                          )),
                    ],
                  ),
                ),
                Expanded(child:Image.network(sImages!)
                ),
              ],
            ),
          )
        ),
      ),
    );
  }
}
