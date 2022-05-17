import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Marketplace extends StatefulWidget {
  const Marketplace({Key? key}) : super(key: key);

  @override
  _MarketplaceState createState() => _MarketplaceState();
}

class _MarketplaceState extends State<Marketplace> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, bottom: 10),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 13),
                        child: Text(
                          "Marketplace",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 25),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 33,
                  width: 33,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2)),
                  child: Icon(
                    Icons.person_rounded,
                    size: 28,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 13, left: 13),
                  child: Icon(
                    Icons.search_outlined,
                    size: 24,
                  ),
                  width: 33,
                  height: 33,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.2)),
                )
              ],
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
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
                          width: MediaQuery.of(context).size.width*0.45,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.center_focus_strong_outlined,
                                size: 19,
                              ),
                              Container(
                                child: Text(
                                  "Sell",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                                margin: EdgeInsets.only(left: 5),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          height: 35,
                          width: MediaQuery.of(context).size.width*0.45,
                          decoration: BoxDecoration(
                              color: Colors.blueGrey.withOpacity(0.15),
                              borderRadius: BorderRadius.circular(20)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.menu,
                                size: 22,
                              ),
                              Container(
                                child: Text(
                                  "Categories",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w700, fontSize: 15),
                                ),
                                margin: EdgeInsets.only(left: 5),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: 45,
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(left: 13),
                            child: Text("Today's Picks",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18),),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 13),
                            child: Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              color: Colors.blue,
                              size: 18,
                            ),
                            Text(
                              "Surat, Gujarat",
                              style: TextStyle(
                                  color: Colors.blue,fontSize: 15.4,),
                            )
                          ],
                        ))
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.535,
                          width: MediaQuery.of(context).size.width*0.492,
                          child: Image.network("https://images.hindustantimes.com/img/2021/08/26/1600x900/5b302f5c-0190-11ec-8bb0-cae8e339dabd_1629977007063.jpg",fit: BoxFit.cover,),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.width*0.535,
                            width: MediaQuery.of(context).size.width*0.492,
                          color: Colors.red,
                          child: Image.network("https://assets.vogue.in/photos/5e31537d7e91b40008fcaa33/master/pass/Pooja%20Hegde%20jewellery.jpg",fit: BoxFit.cover,)
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,bottom: 7),
                          child: FittedBox(child: Text("\$120  NEW MAN...",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.5),)),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 75),
                          child: FittedBox(child: Text("\$360  KURTI",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.5),)),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.535,
                          width: MediaQuery.of(context).size.width*0.492,
                          child: Image.network("https://images.unsplash.com/photo-1605100804763-247f67b3557e?ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8cmluZ3xlbnwwfHwwfHw%3D&ixlib=rb-1.2.1&w=1000&q=80",fit:BoxFit.cover,),
                        ),
                        Container(
                          height:MediaQuery.of(context).size.width*0.535,
                          width: MediaQuery.of(context).size.width*0.492,
                          color: Colors.red,
                          child: Image.network("https://www.serendipitydiamonds.com/blog/wp-content/uploads/2013/12/Rose-gold-engagement-ring-diamond-wedding-ring-730x730.jpg",fit:BoxFit.cover,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,bottom: 7),
                          child: Text("\$500  NEW WOMAN",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.5),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 65),
                          child: Text("CONTACT SELLER",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.5),),
                        )
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height:MediaQuery.of(context).size.width*0.535,
                          width: MediaQuery.of(context).size.width*0.492,
                          child: Image.network("https://timesofindia.indiatimes.com/thumb/msid-82034304,imgsize-187409,width-400,resizemode-4/82034304.jpg",fit:BoxFit.cover,),
                        ),
                        Container(
                          height:MediaQuery.of(context).size.width*0.535,
                          width: MediaQuery.of(context).size.width*0.492,
                          color: Colors.red,
                          child: Image.network("https://cdn.vox-cdn.com/thumbor/adGdPKdK-p5bkTHSO189hV9xA5U=/0x0:1658x852/1200x800/filters:focal(697x294:961x558)/cdn.vox-cdn.com/uploads/chorus_image/image/58309235/Screen_Shot_2018_01_12_at_4.10.28_PM.0.png",fit:BoxFit.cover,),
                        )
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 45,
                    child: Row(
                      children: [
                        Container(
                          margin: EdgeInsets.only(left: 15,bottom: 7),
                          child: Text("\$100  EARTH PRIDE",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.5),),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 65),
                          child: Text("\$1 WIRELESS CHARGER",style: TextStyle(fontWeight: FontWeight.w500,fontSize: 15.5),),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
