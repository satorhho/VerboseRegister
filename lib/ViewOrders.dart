import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PendingOrders.dart';
class PendingOrders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          OutlineButton(
            child: Text("SUBMIT"),
            highlightColor: Colors.white38,
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PendingOrders()),
              );
            },
          ),
        ]
      )
    );
  }
}