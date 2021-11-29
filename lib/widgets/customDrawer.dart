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
              child: ClipRRect(
                borderRadius: BorderRadius.circular(99.0),
                child: Image.network('https://seidnacional.com/portaldoaluno/wp-content/uploads/learn-press-profile/4/172522ec1028ab781d9dfd17eaca4427.jpg'),
              ),
            ),
          )
        ],
      ),
    ),
  );
}
