import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'OrderListContent.dart';

class PendingOrders extends StatelessWidget {
  get fontSize => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
            Container(
            margin: const EdgeInsets.only(top: 100),
            alignment: Alignment.center,
            child: Text(
              "Pending Orders",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 32,
          ),
        ),
      ),
          Container(
          margin: const EdgeInsets.only(top: 40),
          child: Wrap(
              spacing: 140, // to apply margin in the main axis of the wrap
              runSpacing: 20, // to apply margin in the cross axis of the wrap
              children: <Widget>[
                Text('Order ID', style: TextStyle(fontSize: 20,)),
                Text('Status', style: TextStyle(fontSize: 20,)),
              ],
            ),
          ),

      Container(
          margin: const EdgeInsets.only(top: 20),
          child: Wrap(
            spacing: 120, // to apply margin in the main axis of the wrap
            runSpacing: 0, // to apply margin in the cross axis of the wrap

            children: <Widget>[
              OutlineButton(
                child: Text("201810281"),
                highlightColor: Colors.white38,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderListContent()),
                  );
                },
              ),
              Text('Pending', style: TextStyle(fontSize: 18,)),
            ],
          )

          ),
    ],
   )
  );
  }
}
