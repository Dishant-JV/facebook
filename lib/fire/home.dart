import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

class FireHome extends StatefulWidget {
  const FireHome({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<FireHome> {
  FirebaseFirestore fireStore = FirebaseFirestore.instance;
  TextEditingController cEmail = new TextEditingController();
  TextEditingController cPass = new TextEditingController();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  // final Stream<QuerySnapshot> studentsStream =
  //     FirebaseFirestore.instance.collection('students').snapshots();
  // CollectionReference stud = FirebaseFirestore.instance.collection('students');

  // Future<void> ins(String cEmail, String cPass) {
  //   return stud
  //       .add({'email': cEmail, 'name': 'Fenil', 'password': cPass})
  //       .then((value) => print("User is added"))
  //       .catchError((error) => print("error in user addition"));
  // }
  void getData() async {
    CollectionReference data =
        fireStore.collection('seller').doc('Man').collection('sandal');
    QuerySnapshot datasnap = await data.get();
    List ids = datasnap.docs.map((e) => e.data()).toList();
    print(ids);
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        // stream: studentsStream,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (snapshot.hasError) {
        print("Something went wrong");
      }
      if (snapshot.connectionState == ConnectionState.waiting) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      final List storedocs = [];
      snapshot.data?.docs.map((DocumentSnapshot document) {
        Map a = document.data() as Map<String, dynamic>;
        storedocs.add(a);
        a['id'] = document.id;
      }).toList();
      return SafeArea(
        child: Scaffold(
          body: Column(
            children: [
              Form(
                  child: Column(
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Email",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: cEmail,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Password",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.all(15),
                    child: TextFormField(
                      controller: cPass,
                      decoration: InputDecoration(border: OutlineInputBorder()),
                    ),
                  )
                ],
              )),
              SizedBox(
                height: 25,
              ),
              InkWell(
                onTap: () {
                  // ins(cEmail.text, cPass.text);
                  cEmail.clear();
                  cPass.clear();
                },
                child: Container(
                  alignment: Alignment.center,
                  margin: EdgeInsets.all(15),
                  width: double.infinity,
                  height: 50,
                  color: Colors.pink,
                  child: Text("Register"),
                ),
              ),
              ElevatedButton(
                  onPressed: () {
                    fireStore
                        .collection("seller")
                        .doc('Man')
                        .collection('sandal')
                        .add({'type': 'Rainy', 'rate': 899});
                  },
                  child: Text("Enter")),
              ElevatedButton(
                  onPressed: () {
                    getData();
                  },
                  child: Text("GetData"))
            ],
          ),
        ),
      );
    });
  }
}
