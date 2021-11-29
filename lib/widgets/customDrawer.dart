import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget customDrawer() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          Container(
            height: 200,
            width: double.infinity,
            child: CircleAvatar(
              backgroundColor: Colors.teal,
              radius: 50,
            ),
          )
        ],
      ),
    ),
  );
}
