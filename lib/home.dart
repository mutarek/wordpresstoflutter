import 'package:flutter/material.dart';

import 'post.dart';
import 'wp_api/wpapi.dart';

class HomePage extends StatefulWidget {
  _State createState() => _State();
}

class _State extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 150,
              child: FutureBuilder(
                future: fetchWpCategory(),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
                      itemCount: snapshot.data.length,
                      itemBuilder: (BuildContext context, int index) {
                        Map myposts = snapshot.data[index];
                        return Card(
                          child: Center(child: Text(myposts['name'])),
                        );
                      },
                    );
                  }
                  return CircularProgressIndicator();
                },
              ),
            ),
            Container(
              height: 500,
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
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),
    );
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
