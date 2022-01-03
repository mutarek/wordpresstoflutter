import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'home.dart';
import 'widgets/customDrawer.dart';
import 'wp_api/wpapi.dart';

class ShowPost extends StatefulWidget {
  ShowState createState() => ShowState();
}

class ShowState extends State<ShowPost> {
  List blog = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: customDrawer(context),
      ),
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
            blog = snapshot!.data;
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: blog.take(5).length,
                itemBuilder: (BuildContext context, int index) {
                  Map myposts = snapshot.data[index];
                  return PostTile(href: myposts['_links']["wp:featuredmedia"][0]['href'], title: myposts['title']['rendered'].replaceAll('', ""), desc: myposts['excerpt']['rendered'], content: myposts['content']['rendered']);
                },
              );
            }
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.red,
                strokeWidth: 20,
              ),
              heightFactor: 100.0,
            );
          },
        ),
      ),
    );
  }
}
