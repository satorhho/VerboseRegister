import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'PendingOrders.dart';

class confirmation extends StatelessWidget {
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            child: Text(
              "Approved",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Container(
            child: OutlineButton(
              child: Text("View Orders"),
              highlightColor: Colors.white38,
              onPressed: () {
                List<String> templist = [];
                List<dynamic> templistval = [];
                List<String> status_list = [];
                List<String> oid_list = [];

                var future1 = this.databaseReference.child("Order").once().then((DataSnapshot snapshot){
                  Map<dynamic, dynamic> value = snapshot.value;
                  value.forEach((key, values) {
                    templist.add(key);
                    templistval.add(values);
                  });
                });

                future1.then((value) {
                  templistval.forEach((element) {
                    oid_list.add(element["order_id"]);
                    status_list.add(element["status"]);
                  });
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PendingOrders(oid_list, status_list)),
                  );
                });
              },
            ),
          ),
        ]));
  }
}
