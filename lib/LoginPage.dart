import'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'ViewOrders.dart';

class LoginPage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 300),
            alignment: Alignment.center,
            child: Text(
              "Verbose Groceries",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                fontFamily: "Raleway",
              ),
            ),
          ),

          Container(
            margin: const EdgeInsets.only(top: 20),
          alignment: Alignment.center,
            child: Text(
              "Register User Application",
              style: TextStyle(
                fontSize: 18,
                fontFamily: "Raleway",
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: OutlineButton(
              child: Text("START"),
              highlightColor: Colors.white38,
              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ViewOrders()),
                );
              },
            ),
          ),

        ],
      ),
    );
  }

}