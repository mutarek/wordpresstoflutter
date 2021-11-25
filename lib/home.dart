import 'package:flutter/material.dart';

import 'post.dart';
import 'showpost.dart';
import 'wp_api/wpapi.dart';

class HomePage extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('DHAKA CITY'),
          centerTitle: true,
        ),
        drawer: Drawer(),
        body: ShowPost());
  }
}

class PostTile extends StatefulWidget {
  final String href, title, desc, content;
  PostTile({required this.href, required this.title, required this.desc, required this.content});
  @override
  PostState createState() => PostState();
}

class PostState extends State<PostTile> {
  var imgurl = '';
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PostPage(
                      imgurl: imgurl,
                      title: widget.title,
                      desc: widget.content,
                    )));
      },
      child: Container(
        child: Card(
          elevation: 5,
          child: Column(
            children: [
              FutureBuilder(
                future: fetchWpPostImageUrl(widget.href),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    imgurl = snapshot.data["guid"]["rendered"];
                    return Image.network(snapshot.data["guid"]["rendered"]);
                  }
                  return CircularProgressIndicator();
                },
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.title,
                    textAlign: TextAlign.justify,
                    style: TextStyle(fontSize: 18.0),
                  ),
                ),
              ),
              Text(
                widget.desc,
                style: TextStyle(fontSize: 10),
              )
            ],
          ),
        ),
      ),
    );
  }
}
