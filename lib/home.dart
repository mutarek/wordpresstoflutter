import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

import 'post.dart';
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
      body: Container(
        padding: EdgeInsets.all(10),
        child: FutureBuilder(
          future: fetchWpCategory(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, crossAxisSpacing: 10.0, mainAxisSpacing: 10),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  Map myposts = snapshot.data[index];
                  return Card(
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 4,
                            child: Image.network(
                              'https://dhakacity.com.bd/wp-content/uploads/2021/09/dhaka-to-sylhet-air-ticket-from.png',
                              height: 120,
                              fit: BoxFit.contain,
                              width: 180.0,
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: Center(child: Text(myposts['slug'].toUpperCase())),
                          )
                        ],
                      ),
                    ),
                  );
                },
              );
            }
            return CircularProgressIndicator();
          },
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
  Widget shortDescriptionView() {
    return Html(
      data: widget.desc,
    );
  }

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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          child: Column(
            children: [
              FutureBuilder(
                future: fetchWpPostImageUrl(widget.href),
                builder: (BuildContext context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    imgurl = snapshot.data["guid"]["rendered"];
                    return ClipRRect(borderRadius: BorderRadius.circular(11.0), child: Image.network(snapshot.data["guid"]["rendered"]));
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
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18.0, color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Divider(
                color: Colors.red,
              ),
              shortDescriptionView(),
            ],
          ),
        ),
      ),
    );
  }
}
