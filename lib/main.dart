import 'package:facebook/ChatApp/chat_login.dart';
import 'package:facebook/ChatApp/sharedpreference_data.dart';
import 'package:facebook/Diamond/owner/owner_home.dart';
import 'package:facebook/Google%20Map/dynamic_textfield.dart';
import 'package:facebook/Google%20Map/google_map.dart';
import 'package:facebook/constant/theme.dart';
import 'package:facebook/realtime_data_firestore/realtime_data_firestore.dart';
import 'package:flutter/material.dart';
import 'package:facebook/Mobx/mobx_signup_home.dart';
import 'package:facebook/Mobx/mobx_signup_model.dart';
import 'package:facebook/Model/viewproduct.dart';
import 'package:facebook/carouselslider_demo.dart';
import 'package:facebook/fire_auth/login_number.dart';
import 'package:facebook/listview_demo.dart';
import 'package:facebook/screen/animatedlistview_screen.dart';
import 'package:facebook/screen/booklistview_screen.dart';
import 'package:facebook/screen/downloading_screen.dart';
import 'package:facebook/screen/home.dart';
import 'package:facebook/screen/introduction_screen.dart';
import 'package:facebook/screen/marketplace.dart';
import 'package:facebook/screen/menu.dart';
import 'package:facebook/screen/notification.dart';
import 'package:facebook/screen/person.dart';
import 'package:facebook/screen/profile.dart';
import 'package:facebook/screen/webviewdemo.dart';
import 'package:facebook/textfield_demo.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'ChatApp/chat_home.dart';
import 'Diamond/emp_home.dart';
import 'Diamond/emp_login.dart';
import 'Diamond/owner/owner_login.dart';
import 'Mobx/demo_mobx_home.dart';
import 'Mobx/mobx_signup.dart';
import 'Realtime Database/realtime_data.dart';
import 'barcode_generator.dart';
import 'barcode_scanner.dart';
import 'block_statemangement/bloc_demo_screen.dart';
import 'change_theme_demo.dart';
import 'database/database_dem.dart';
import 'download_share.dart';
import 'fire/image_upload.dart';
import 'fire_auth/login.dart';
import 'fire/home.dart';
import 'fire/registration_screen.dart';
import 'fire_auth/login_otp.dart';
import 'fire_auth/registration.dart';
import 'generated/l10n.dart';
import 'jsonSerarilze/api_demo_screen.dart';
import 'login_screen.dart';

MobxSignUpModel mobxSignUpModel = MobxSignUpModel();
void main() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    AndroidGoogleMapsFlutter.useAndroidViewSurface = true;
  }
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  await Firebase.initializeApp();
  runApp(
    GetMaterialApp(
      // theme: Themes.light,
      // darkTheme: Themes.dark,
      home: RealTimeDataFirestore(),
      localizationsDelegates: [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  void isLoggedin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    login = prefs.getBool('isLoggedIn')!;
  }

  bool login = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    isLoggedin();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _initialization,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            print("Something went wrong");
          }
          if (snapshot.connectionState == ConnectionState.done) {
            return MaterialApp(
                debugShowCheckedModeBanner: false,
                home: login == true ? Fb() : ScanCode());
          }
          return CircularProgressIndicator();
        });
  }
}

class Fb extends StatefulWidget {
  final int index;
  final String? name;
  final String? url;

  const Fb({Key? key, this.index = 0, this.name, this.url}) : super(key: key);

  @override
  _FbState createState() => _FbState();
}

class _FbState extends State<Fb> {
  @override
  int curindex = 0;
  int snackBar = 0;

  @override
  void initState() {
    super.initState();
    curindex = widget.index;
  }

  List<Widget> pageList = [
    Home(),
    Person(),
    Marketplace(),
    Profile(),
    Notifications(),
    Menu()
  ];

  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        children: [
          Container(
              child: curindex == 0
                  ? Container(
                      margin: EdgeInsets.only(top: 10, bottom: 8),
                      child: Row(
                        children: [
                          Expanded(
                              child: Row(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  final snackBar = SnackBar(
                                    content: Text("undo the changes"),
                                    duration: Duration(seconds: 2),
                                    action: SnackBarAction(
                                      label: "undo",
                                      onPressed: () {},
                                    ),
                                  );
                                  ScaffoldMessenger.of(context)
                                      .showSnackBar(snackBar);
                                },
                                child: Container(
                                  height: 30,
                                  width: 160,
                                  child: Image.asset(
                                    "assets/images/fblogo.png",
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          )),
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.1)),
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Icon(Icons.search_sharp))),
                          Container(
                              margin: EdgeInsets.only(right: 10),
                              height: 36,
                              width: 36,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.grey.withOpacity(0.1)),
                              child: Container(
                                  padding: EdgeInsets.all(5),
                                  child: Image.asset(
                                    "assets/images/chat.png",
                                    height: 20,
                                    width: 20,
                                    fit: BoxFit.contain,
                                  )))
                        ],
                      ),
                    )
                  : Container()),
          Container(
            decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Colors.grey.withOpacity(0.5)))),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  height: 37,
                  width: 37,
                  child: InkWell(
                    child: curindex == 0
                        ? Image.asset(
                            "assets/images/home.png",
                            fit: BoxFit.cover,
                            color: Colors.blue,
                          )
                        : Image.asset(
                            "assets/images/home.png",
                            fit: BoxFit.cover,
                          ),
                    onTap: () {
                      setState(() {
                        curindex = 0;
                      });
                    },
                  ),
                ),
                Container(
                    height: 35,
                    width: 35,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          curindex = 1;
                        });
                      },
                      child: curindex == 1
                          ? Image.asset(
                              "assets/images/people.png",
                              fit: BoxFit.cover,
                              color: Colors.blue,
                            )
                          : Image.asset("assets/images/people.png",
                              fit: BoxFit.cover),
                    )),
                Container(
                    height: 40,
                    width: 40,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          curindex = 2;
                        });
                      },
                      child: curindex == 2
                          ? Image.asset(
                              "assets/images/marketplace.png",
                              fit: BoxFit.cover,
                              color: Colors.blue,
                            )
                          : Image.asset("assets/images/marketplace.png",
                              fit: BoxFit.cover),
                    )),
                Container(
                    height: 44,
                    width: 44,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          curindex = 3;
                        });
                      },
                      child: curindex == 3
                          ? Image.asset(
                              "assets/images/person.png",
                              fit: BoxFit.cover,
                              color: Colors.blue,
                            )
                          : Image.asset("assets/images/person.png",
                              fit: BoxFit.cover),
                    )),
                Container(
                    height: 33,
                    width: 33,
                    child: InkWell(
                      onTap: () {
                        setState(() {
                          curindex = 4;
                        });
                      },
                      child: curindex == 4
                          ? Image.asset(
                              "assets/images/alert.png",
                              fit: BoxFit.cover,
                              color: Colors.blue,
                            )
                          : Image.asset("assets/images/alert.png",
                              fit: BoxFit.cover),
                    )),
                InkWell(
                  onTap: () {
                    setState(() {
                      curindex = 5;
                    });
                  },
                  child: curindex == 5
                      ? Icon(
                          Icons.menu,
                          size: 24,
                          color: Colors.blue,
                        )
                      : Icon(
                          Icons.menu,
                          size: 24,
                        ),
                ),
              ],
            ),
          ),
          Expanded(
            child: pageList[curindex],
          )
        ],
      ),
    ));
  }
}
