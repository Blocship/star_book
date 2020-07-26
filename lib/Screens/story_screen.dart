import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:zefyr/zefyr.dart';

import '../constants.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("Write Your Story!\n");
    return NotusDocument.fromDelta(delta);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.only(top: 36, left: 16, bottom: 8),
              child: Text(
                "Story Title",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                textAlign: TextAlign.start,
                onChanged: (value) {},
                decoration: kTextFieldDecoration.copyWith(
                    hintText: "Start With Your Feelings!"),
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 8, left: 16, bottom: 8),
              child: Text(
                "Your Story",
                style: TextStyle(fontSize: 18),
              ),
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 12),
                decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  border: Border.all(
                    color: Colors.blueAccent,
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(18),
                ),
                child: ZefyrScaffold(
                  child: ZefyrEditor(
                    controller: _controller,
                    focusNode: _focusNode,
                    padding: EdgeInsets.all(8),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
