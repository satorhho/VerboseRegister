import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'OrderListContent.dart';

class OrderListContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Text(
          "201810281",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 30,
            decoration: TextDecoration.underline,
          ),
        ),
      ),
      Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Text(
          "Item Name",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),

      Container(
        margin: const EdgeInsets.only(top: 100),
        alignment: Alignment.center,
        child: Text(
          "Description",
          style: TextStyle(
            fontSize: 20,

          ),
        ),
      ),
    ],
   )
  );
  }
}
