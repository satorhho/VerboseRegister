import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PendingOrders.dart';

class ViewOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.center, children: [
      Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 20),
        child: Text(
          "Press To Show Pending Orders",
          style: TextStyle(
            fontSize: 18,
            fontFamily: "Raleway",
          ),
        ),
      ),
      OutlineButton(
        child: Text("View Orders"),
        highlightColor: Colors.white38,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => PendingOrders()),
          );
        },
      ),
    ]));
  }
}
