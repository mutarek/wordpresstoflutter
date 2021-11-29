import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

Widget customDrawer() {
  return SingleChildScrollView(
    child: Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              Fluttertoast.showToast(msg: "This is Center Short Toast", toastLength: Toast.LENGTH_SHORT, gravity: ToastGravity.CENTER, timeInSecForIosWeb: 1, backgroundColor: Colors.red, textColor: Colors.white, fontSize: 16.0);
            },
            child: Container(
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
            ),
          )
        ],
      ),
    ),
  );
}
