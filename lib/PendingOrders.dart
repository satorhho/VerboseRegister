import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:verbose_register/OrderListContent.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class PendingOrders extends StatelessWidget {
  List<dynamic> order_ids;
  List<dynamic> statuses;


  PendingOrders(List<String> orderIds, List<String> statusList){
    this.order_ids = orderIds;
    this.statuses = statusList;

    // print(order_ids);
    // print(statuses);
  }

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
            Expanded(
                child: Row(
                  children: [
                    // FOR ORDER ID
                    Expanded(
                      child: ListView.builder(
                        itemCount: this.order_ids.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            child: OutlineButton(
                              child: Text('${this.order_ids[index]}'),
                              highlightColor: Colors.white38,
                              onPressed: () {
                                var idx = this.order_ids.length - index; // for dbref.("Parent/child$idx")


                                List<String> templist1 = [];
                                List<dynamic> templistval1 = [];

                                var future1 = this.databaseReference.child("Order").once().then((DataSnapshot snapshot) {
                                  Map<dynamic, dynamic> value = snapshot.value;
                                  value.forEach((key, values) {
                                    templist1.add(key);           // order counters e.g. [order9, order8]
                                    templistval1.add(values);     // map values e.g

                                  });
                                });



                                future1.then((value) {
                                  List<dynamic> rev_lst = new List.from(templist1.reversed);
                                  List<dynamic> rev_val = new List.from(templistval1.reversed);
                                  var store = rev_val[idx-1];
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        OrderListContent(store["order_id"], store["stock_id"],store["status"], rev_lst[idx-1])
                                    ),
                                  );

                                });

                              },
                            ),
                          );
                        },
                      ),
                    ),

                    //FOR STATUS

                    Expanded(
                      child: ListView.builder(
                        itemCount: this.statuses.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Container(
                            height: 50,
                            child: Center(child: Text('${this.statuses[index]}')),
                          );
                        },
                      ),
                    ),

                  ],
                )
            ),
          ],
        )
    );
  }
  void updateData(int counter) {
    this.databaseReference.child("Order/order$counter").update({
      "status": "Confirmed"
    });
  }

  void checkConfirmed(int index) {
    if (this.statuses[index] == "Confirmed") {
      return null;
    }
  }
}