import 'package:flutter/material.dart';
import 'item.dart';

class ViewProduct extends StatefulWidget {
  const ViewProduct({Key? key}) : super(key: key);

  @override
  _ViewProductState createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {

  @override
  Widget build(BuildContext context) {
   // final main= Item.product.map((bike) {
   //    return Container(
   //      child: Column(
   //        children: [
   //          Text(bike.id.toString()),
   //          Text(bike.name.toString()),
   //          Text(bike.age.toString()),
   //          SizedBox(
   //            height: 30,
   //          )
   //        ],
   //      ),
   //    );
   //  }).toList();
     List<Item> product=[
      Item(
          id : 1,
          name : "Dishant",
          age : "10"
      ),
      Item(
          id : 2,
          name : "Rajnik",
          age : "102"
      ),
      Item(
          id : 3,
          name : "Haribhai",
          age : "23"
      ),
    ];
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView.builder(
              itemCount: product.length,
              itemBuilder: (context,index) {
                return Container(
                  child: Column(
                    children: [
                      Text(product[index].id.toString()),
                      Text(product[index].name.toString()),
                      Text(product[index].age.toString()),
                      SizedBox(height: 10,)

                    ],
                  )
                );
              }),
        ),
      ),
    );
  }
}
