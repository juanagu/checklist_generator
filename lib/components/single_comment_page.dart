import 'package:flutter/material.dart';

class SingleCommentPage extends StatefulWidget {
  final String title;
  final String comment;
  final Function onSaveComment;

  const SingleCommentPage({
    Key key,
    this.title,
    this.comment = "",
    this.onSaveComment,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SingleCommentPageState();
  }
}

class SingleCommentPageState extends State<SingleCommentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
        ),
        leading: IconButton(
          icon: Icon(
            Icons.close,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.check,
            ),
            onPressed: () => Navigator.of(context).pop(),
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a comment'),
          ),
        ),
      ),
    );
  }
}
