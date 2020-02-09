import 'package:dynamic_form_process/core/checklist_step.dart';
import 'package:flutter/material.dart';

class SingleCommentPage extends StatefulWidget {
  final String title;
  final String comment;
  final Function onSaveComment;

  final int maxLength;
  final bool maxLengthEnforced;

  final ChecklistStep checklistStep;

  const SingleCommentPage({
    Key key,
    this.title,
    this.comment = "",
    this.onSaveComment,
    this.maxLength = 250,
    this.maxLengthEnforced = true,
    this.checklistStep,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return SingleCommentPageState();
  }
}

class SingleCommentPageState extends State<SingleCommentPage> {
  final commentController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.comment != null) {
      commentController.text = widget.comment;
    }
  }

  @override
  void dispose() {
    commentController.dispose();
    super.dispose();
  }

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
            onPressed: () {
              widget.onSaveComment(
                  widget.checklistStep, commentController.text);
              Navigator.of(context).pop();
            },
          )
        ],
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: TextField(
            controller: commentController,
            maxLines: 20,
            maxLengthEnforced: widget.maxLengthEnforced,
            maxLength: widget.maxLength,
            decoration: InputDecoration(
                border: InputBorder.none, hintText: 'Enter a comment'),
          ),
        ),
      ),
    );
  }
}
