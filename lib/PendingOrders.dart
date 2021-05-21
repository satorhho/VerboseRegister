import 'package:firebase_database/firebase_database.dart';
import 'package:verbose_register/OrderListContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class PendingOrders extends StatelessWidget {
  get fontSize => null;
  final databaseReference = FirebaseDatabase.instance.reference();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Container(

              margin: const EdgeInsets.only(top: 50, bottom: 50),
              alignment: Alignment.center,
              child: Text(
                "Pending Orders",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 80),
                  child: Text("Order ID"),
                ),
                Container(
                  margin: const EdgeInsets.only(left: 160, right: 50),
                  child: Text("Status"),
                ),
              ],
            ),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 50,
                  margin: const EdgeInsets.only(left: 60, top: 20),
                  child: OutlineButton(
                    child: Text("OID1"),
                    highlightColor: Colors.white38,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => OrderListContent()),
                      );
                      createRecord();
                    },
                  ),
                ),
              ],
            ),
          ],
        )
    );
  }
    void createRecord() {
      databaseReference.child("Order").set({
        'order_id': 'OID1',
        'status': 'Pending'
      });
    }
    void getData(){
      databaseReference.once().then((DataSnapshot snapshot) {
        print('${snapshot.value}');
      });
    }
}