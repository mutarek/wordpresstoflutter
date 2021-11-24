import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class PostPage extends StatefulWidget {
  final String title, imgurl, desc;
  PostPage({required this.title, required this.imgurl, required this.desc});
  @override
  _State createState() => _State();
}

class _State extends State<PostPage> {
  Widget postContent(htmlContent) {
    return Html(
      data: htmlContent,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Image.network(widget.imgurl),
              postContent(widget.desc)
            ],
          ),
        ),
      ),
    );
  }
}
