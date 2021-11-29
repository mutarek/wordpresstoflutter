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
              backgroundImage: Image.network(Uri.parse('https://seidnacional.com/portaldoaluno/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg')),
            ),
          )
        ],
      ),
    ),
  );
}
