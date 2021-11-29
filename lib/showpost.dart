import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'wp_api/wpapi.dart';

class ShowPost extends StatefulWidget {
  ShowState createState() => ShowState();
}

class ShowState extends State<ShowPost> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('Dhaka City'),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: fetchWpPost(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map myposts = snapshot.data[index];
                  return PostTile(href: myposts['_links']["wp:featuredmedia"][0]['href'], title: myposts['title']['rendered'].replaceAll('#038;', ""), desc: myposts['excerpt']['rendered'], content: myposts['content']['rendered']);
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(),
              heightFactor: 50.0,
            );
          },
        ),
      ),
    );
  }
}
