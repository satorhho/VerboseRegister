import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Confirmation.dart';

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
            margin: const EdgeInsets.only(top: 40),
            child: Wrap(
              spacing: 120, // to apply margin in the main axis of the wrap
              runSpacing: 20, // to apply margin in the cross axis of the wrap
              children: <Widget>[
                Text('Item Name', style: TextStyle(fontSize: 20,)),
                Text('Description', style: TextStyle(fontSize: 20,)),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
          child: Wrap(
            spacing: 140, // to apply margin in the main axis of the wrap
            runSpacing: 20, // to apply margin in the cross axis of the wrap

            children: <Widget>[
              Text('Marlboro', style: TextStyle(fontSize: 18,)),
              Text('This is a text', style: TextStyle(fontSize: 18,)),
          ]
          ),
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
              },
            ),
          )

    ],
   )
  );
  }
}
