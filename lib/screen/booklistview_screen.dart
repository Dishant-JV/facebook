import 'dart:ui';
import 'package:facebook/Model/book.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BookListviewScreen extends StatefulWidget {
  const BookListviewScreen({Key? key}) : super(key: key);

  @override
  _BookListviewScreenState createState() => _BookListviewScreenState();
}

class _BookListviewScreenState extends State<BookListviewScreen> {
  Widget buildBook(int index) => ListTile(
        title: Text(displayBook[index].name.toString()),
        subtitle: Text(
          displayBook[index].author.toString(),
          style: TextStyle(color: Colors.grey),
        ),
      );
  List<Book> books = [
    Book(name: "ramani keyur", author: "Dishant vagasiya"),
    Book(name: "kevin barvaliya", author: "Rajink vagasiya"),
    Book(name: "fenil bana", author: "Kalu samjya vagasiya"),
    Book(name: "LP kathiriya", author: "Raju vagasiya"),
    Book(name: "UY shah", author: "Kanji vagasiya"),
    Book(name: "Kanij paladiya", author: "Kanji vagasiya"),
    Book(name: "raj mak", author: "Kanji vagasiya"),
    Book(name: "avani vadoaoriya", author: "Kanji vagasiya"),
    Book(name: "meet ranoliya", author: "Kanji vagasiya"),
  ];
  List<Book> displayBook = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    displayBook = books;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: TextFormField(
                onChanged: (value) {
                  value = value.toLowerCase();
                  setState(() {
                    displayBook = books
                        .where((u) => (u.name!.toLowerCase().contains(value) ||
                            u.author!.toLowerCase().contains(value)))
                        .toList();
                  });
                },
                decoration: InputDecoration(
                    isDense: true, border: OutlineInputBorder()),
              ),
            ),
            Container(
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemCount: displayBook.length,
                  itemBuilder: (context, index) {
                    return buildBook(index);
                  }),
            ),
          ],
        ),
      )),
    );
  }
}
