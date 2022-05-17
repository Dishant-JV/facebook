import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:facebook/Diamond/lot_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:uuid/uuid.dart';

class EmpHome extends StatefulWidget {
  const EmpHome({Key? key}) : super(key: key);

  @override
  _EmpHomeState createState() => _EmpHomeState();
}

class _EmpHomeState extends State<EmpHome> {
  bool isUpload = false;
  int totalNumberOfLot = 1;
  int totalDiamond = 0;
  double totalWeight = 0;
  double totalEarning = 0;
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  LotModel lotModel = LotModel();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  List<LotModel> lstLot = [];
  List finalLotList = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    lstLot.add(LotModel());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      physics: BouncingScrollPhysics(),
      child: Container(
        padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + 20, left: 10, right: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Welcome",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w500),
                ),
                InkWell(
                  onTap: () {
                    setState(() {
                      lstLot.add(LotModel());
                      totalNumberOfLot = lstLot.length;
                    });
                  },
                  child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade300, shape: BoxShape.circle),
                      child: Icon(
                        Icons.add,
                        size: 30,
                      )),
                )
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Text(
                  "Total number of lot : ",
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
                ),
                Text(totalNumberOfLot.toString(),
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500))
              ],
            ),
            SizedBox(
              height: 25,
            ),
            Form(
              key: globalKey,
              child: ListView.builder(
                  padding: EdgeInsets.zero,
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: lstLot.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(bottom: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                diamondUI(index),
                                priceUI(index),
                                weightUI(index),
                              ],
                            ),
                          ),
                          index == 0
                              ? SizedBox(
                                  width: 20,
                                )
                              : SizedBox(
                                  width: 20,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        lstLot.removeAt(index);
                                        totalNumberOfLot = lstLot.length;
                                      });
                                    },
                                    child: Icon(
                                      Icons.remove_circle_outline,
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                        ],
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                finalLotList.clear();
                totalDiamond = 0;
                totalWeight = 0;
                totalEarning = 0;
                final form = globalKey.currentState;
                if (globalKey.currentState?.validate() == true) {
                  form?.save();
                  lstLot.forEach((element) {
                    finalLotList.add(element.toJson());
                    totalEarning = totalEarning +
                        (element.diamond! * element.price!.toDouble());
                    totalDiamond = totalDiamond + element.diamond!.toInt();
                    totalWeight = totalWeight + element.weight!.toDouble();
                  });
                  print(finalLotList);
                  showDialog(
                      barrierDismissible: false,
                      context: context,
                      builder: (BuildContext context) {
                        return StatefulBuilder(builder: (context, setState) {
                          return Dialog(
                            child: Container(
                              height: 200,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 20, top: 15, bottom: 10),
                                    child: Text(
                                      "Please Note",
                                      style: TextStyle(
                                          fontSize: 22,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(
                                      left: 20,
                                    ),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(
                                              "Total diamond : ",
                                              style: TextStyle(
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            Text(totalDiamond.toString(),
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text("Total weight : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(totalWeight.toString(),
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text("Total earning : ",
                                                style: TextStyle(
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.w500)),
                                            Text(totalEarning.toString(),
                                                style: TextStyle(
                                                    fontSize: 19,
                                                    fontWeight: FontWeight.w500,
                                                    color: Colors.red))
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            ElevatedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                child: Text("Cancel")),
                                            Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10),
                                                child: isUpload == true
                                                    ? CircularProgressIndicator()
                                                    : InkWell(
                                                        onTap: () {
                                                          setState(() {
                                                            print(isUpload);
                                                            isUpload = true;
                                                            print(isUpload);
                                                          });
                                                          saveData();
                                                          final form = globalKey
                                                              .currentState;
                                                          form?.reset();
                                                          setState(() {
                                                            lstLot.clear();
                                                            totalNumberOfLot =
                                                                1;
                                                          });
                                                          lstLot
                                                              .add(LotModel());
                                                        },
                                                        child: Container(
                                                          alignment:
                                                              Alignment.center,
                                                          decoration:
                                                              BoxDecoration(
                                                                  color: Colors
                                                                      .blue),
                                                          height: 40,
                                                          width: 60,
                                                          child: Text("Ok"),
                                                        ),
                                                      )),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        });
                      });
                }
              },
              child: Container(
                alignment: Alignment.center,
                height: 40,
                width: 80,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5), color: Colors.blue),
                child: Text(
                  "submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                      fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }

  Widget diamondUI(int index) {
    return Container(
      height: 50,
      width: 100,
      child: FormHelper.inputFieldWidget(context, "", "diamond", (onValidate) {
        if (onValidate.toString().isEmpty) {
          return "diamond ${index + 1} can't be empty";
        }
      }, (onSaved) {
        lstLot[index].diamond = int.parse(onSaved);
      },
          hintColor: Colors.grey.shade400.withOpacity(0.7),
          borderColor: Colors.grey.shade500,
          borderFocusColor: Colors.grey.shade600,
          borderRadius: 2,
          fontSize: 15,
          isNumeric: true,
          paddingLeft: 0,
          paddingRight: 0,
          paddingTop: 0,
          paddingBottom: 0),
    );
  }

  Widget priceUI(int index) {
    return Container(
      height: 50,
      width: 100,
      child: FormHelper.inputFieldWidget(
        context,
        "",
        "price",
        (onValidate) {
          if (onValidate.toString().isEmpty) {
            return "price ${index + 1} can't be empty";
          }
        },
        (onSaved) {
          lstLot[index].price = double.parse(onSaved);
        },
        hintColor: Colors.grey.shade400.withOpacity(0.7),
        borderColor: Colors.grey.shade500,
        borderFocusColor: Colors.grey.shade600,
        borderRadius: 2,
        fontSize: 15,
        isNumeric: true,
        paddingLeft: 0,
        paddingRight: 0,
        paddingTop: 0,
        paddingBottom: 0,
      ),
    );
  }

  Widget weightUI(int index) {
    return Container(
      height: 50,
      width: 100,
      child: FormHelper.inputFieldWidget(context, "", "weight", (onValidate) {
        if (onValidate.toString().isEmpty) {
          return "weight ${index + 1} can't be empty";
        }
      }, (onSaved) {
        lstLot[index].weight = double.parse(onSaved);
      },
          hintColor: Colors.grey.shade400.withOpacity(0.7),
          borderColor: Colors.grey.shade500,
          borderFocusColor: Colors.grey.shade600,
          borderRadius: 2,
          fontSize: 15,
          isNumeric: true,
          paddingLeft: 0,
          paddingRight: 0,
          paddingTop: 0,
          paddingBottom: 0),
    );
  }

  // Widget showingBox(int diamond, double weight, double earning) {
  //   return Dialog(
  //     child: Container(
  //       height: 200,
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.only(left: 20, top: 15, bottom: 10),
  //             child: Text(
  //               "Please Note",
  //               style: TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
  //             ),
  //           ),
  //           Container(
  //             padding: EdgeInsets.only(
  //               left: 20,
  //             ),
  //             child: Column(
  //               children: [
  //                 Row(
  //                   children: [
  //                     Text(
  //                       "Total diamond : ",
  //                       style: TextStyle(
  //                           fontSize: 18, fontWeight: FontWeight.w500),
  //                     ),
  //                     Text(diamond.toString(),
  //                         style: TextStyle(
  //                             fontSize: 19,
  //                             fontWeight: FontWeight.w500,
  //                             color: Colors.red))
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 5,
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text("Total weight : ",
  //                         style: TextStyle(
  //                             fontSize: 18, fontWeight: FontWeight.w500)),
  //                     Text(weight.toString(),
  //                         style: TextStyle(
  //                             fontSize: 19,
  //                             fontWeight: FontWeight.w500,
  //                             color: Colors.red))
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 5,
  //                 ),
  //                 Row(
  //                   children: [
  //                     Text("Total earning : ",
  //                         style: TextStyle(
  //                             fontSize: 18, fontWeight: FontWeight.w500)),
  //                     Text(earning.toString(),
  //                         style: TextStyle(
  //                             fontSize: 19,
  //                             fontWeight: FontWeight.w500,
  //                             color: Colors.red))
  //                   ],
  //                 ),
  //                 SizedBox(
  //                   height: 10,
  //                 ),
  //                 Row(
  //                   mainAxisAlignment: MainAxisAlignment.end,
  //                   children: [
  //                     ElevatedButton(
  //                         onPressed: () {
  //                           Navigator.pop(context);
  //                         },
  //                         child: Text("Cancel")),
  //                     Padding(
  //                         padding: const EdgeInsets.symmetric(horizontal: 10),
  //                         child: isUpload == true
  //                             ? CircularProgressIndicator()
  //                             : InkWell(
  //                                 onTap: () {
  //                                   setState(() {
  //                                     print(isUpload);
  //                                     isUpload = true;
  //                                     print(isUpload);
  //                                   });
  //                                   // saveData();
  //                                   delayed();
  //                                   final form = globalKey.currentState;
  //                                   form?.reset();
  //                                   setState(() {
  //                                     lstLot.clear();
  //                                     totalNumberOfLot = 1;
  //                                   });
  //                                   lstLot.add(LotModel());
  //                                 },
  //                                 child: Container(
  //                                   alignment: Alignment.center,
  //                                   decoration:
  //                                       BoxDecoration(color: Colors.blue),
  //                                   height: 40,
  //                                   width: 60,
  //                                   child: Text("Ok"),
  //                                 ),
  //                               )),
  //                   ],
  //                 )
  //               ],
  //             ),
  //           ),
  //         ],
  //       ),
  //     ),
  //   );
  // }

  saveData() async {
    print("save data");
    print(finalLotList);
    print(totalDiamond);
    String datetime = DateTime.now().toString();
    String uniqueId = Uuid().v1();
    String calculationId = uniqueId.split("-").join("");
    var userId = firebaseAuth.currentUser?.uid;
    try {
      await fireStore
          .collection('Employee')
          .doc(userId)
          .collection('Calculation')
          .doc(calculationId)
          .set({
        "calculation": finalLotList,
        "totalLot": totalNumberOfLot,
        "totalDiamond": totalDiamond,
        "totalWeight": totalWeight,
        "totalEarning": totalEarning,
        "dateTime": datetime,
        "calculationID": uniqueId,
      }).whenComplete(() {
        setState(() {
          print(isUpload);
          isUpload = false;
          print("data Uploaded");
          Navigator.pop(context);
        });
      }).onError((error, stackTrace) async {
        await FirebaseFirestore.instance.clearPersistence();
        print("ERROR OCCURED");
      });
    } on FirebaseAuthException catch (e) {
      print("error occured $e");
    }
  }

  void delayed() async {
    Future.delayed(Duration(seconds: 5), () {
      setState(() {
        isUpload = false;
        Navigator.pop(context);
      });
    });
  }
}
