import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Confirmation.dart';





class OrderListContent extends StatelessWidget {
 final databaseReference = FirebaseDatabase.instance.reference();
 String order_id;
 String stock_name;
 String description;

 String order_num;

 OrderListContent(String order_id, String stock_name, String description, String order_num){
   this.order_id = order_id;
   this.stock_name = stock_name;
   this.description = description;
   this.order_num = order_num;
 }

 @override
 Widget build(BuildContext context) {
   return Scaffold(
       body: Column(
         children: [
           Container(
             margin: const EdgeInsets.only(top: 50, bottom: 50),
             alignment: Alignment.center,
             child:  Text(
               this.order_id,
               style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),

           Row(
             children: [
               Container(
                 margin: const EdgeInsets.only(left: 70),
                 child: Text(
                   this.stock_name,
                   style: TextStyle(
                       fontSize: 20
                   ),
                 ),
               ),
               Container(
                 margin: const EdgeInsets.only(left: 75),
                 child: Text(
                   "Description",
                   style: TextStyle(
                       fontSize: 20
                   ),
                 ),
               ),
             ],
           ),

           Row(
             children: [
               Container(
                 margin: const EdgeInsets.only(left: 75),
                 child: Text(this.stock_name),
               ),
               Container(
                 margin: const EdgeInsets.only(left: 120),
                 child: Text(this.description),
               ),
             ],
           ),

          Container(
            width: 200,
            height: 50,
            margin: const EdgeInsets.only(top: 100),
            child:
            OutlineButton(
              child: Text("APPROVE ORDER"),
              highlightColor: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => Confirmation(this.order_num)),
                );

               //updateData();
              },
            ),
          )
    ],
   )
  );
  }
 void checkdata(List<dynamic> sid){
   databaseReference.orderByChild("Stock").equalTo("SID3");
 }
 void readData(){
   databaseReference.once().then((DataSnapshot snapshot) {
     print('Data : ${snapshot.value}');
   });
 }
}
