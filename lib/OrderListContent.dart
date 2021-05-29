import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'Confirmation.dart';





class OrderListContent extends StatelessWidget {


 List<dynamic> order_ids;
 List<dynamic> stock_ids;
 List<dynamic> stock_names;
 List<dynamic> stock_description;



 OrderListContent(List<String> oid,List<String> sid_list,List<String> s_names,List<String> s_desc){
   this.order_ids = oid;
   this.stock_ids = sid_list;
   this.stock_names = s_names;
   this.stock_description = s_desc;

   print(order_ids);
   print(stock_ids);
   print(stock_names);
   print(stock_description);
 }
 
 final databaseReference = FirebaseDatabase.instance.reference();
 @override

 Widget build(BuildContext context) {
   return Scaffold(
       body: Column(
         children: [
           Container(
             margin: const EdgeInsets.only(top: 50, bottom: 50),
             alignment: Alignment.center,
             child:  Text(
               '${this.order_ids}',
               style: TextStyle(
                 fontSize: 35,
                 fontWeight: FontWeight.bold,
               ),
             ),
           ),

           Row(
             children: [
               Container(
                 margin: const EdgeInsets.only(left: 75),
                 child: Text("Stock Name"),
               ),
               Container(
                 margin: const EdgeInsets.only(left: 145, right: 50),
                 child: Text("Description"),
               ),
             ],
           ),

           Expanded(
               child: Row(
                 children: [
                   // FOR ORDER ID
                   Expanded(
                     child: ListView.builder(
                       itemCount: this.stock_ids.length,
                       itemBuilder: (BuildContext context, int index) {
                         checkdata(this.stock_ids);
                         return Container(
                           height: 50,
                           child: Center(child: Text('${this.stock_names[index]}')),
                         );
                       },
                     ),
                   ),

                   //FOR STATUS

                   Expanded(
                     child: ListView.builder(
                       itemCount: this.stock_description.length,
                       itemBuilder: (BuildContext context, int index) {
                         return Container(
                           height: 50,
                           child: Center(child: Text('${this.stock_description[index]}')),
                         );
                       },
                     ),
                   ),

                 ],
               )
           ),

          Container(
            width: 200,
            height: 50,
            margin: const EdgeInsets.only(top: 400),
            child:
            OutlineButton(
              child: Text("APPROVE ORDER"),
              highlightColor: Colors.white38,
              onPressed: () {
                Navigator.push(
                  context,MaterialPageRoute(builder: (context) => confirmation()),
                );
                updateData(1);
               //updateData();
              },
            ),
          )
    ],
   )
  );
  }
 void updateData(int counter) {
   this.databaseReference.child("Order/order$counter").update({
     "status": "confirmed"
   });
 }
 void checkdata(List<dynamic> sid){
   String index;
   if(this.stock_ids == "SID3")
     index = "3";
   else if(this.stock_ids == "SID2")
     index = "2";
   else if(this.stock_ids == "SID1")
     index = "1";
 }
}
