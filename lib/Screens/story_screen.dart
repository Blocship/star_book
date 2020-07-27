import 'package:flutter/material.dart';
import 'package:quill_delta/quill_delta.dart';
import 'package:star_book/main.dart';
import 'package:star_book/models/activity.dart';
import 'package:zefyr/zefyr.dart';

import '../constants.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  ZefyrController _controller;
  FocusNode _focusNode;
  UnfocusDisposition disposition = UnfocusDisposition.scope;
  String storyTitle;
  String storyDesc;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final document = _loadDocument();
    _controller = ZefyrController(document);
    _focusNode = FocusNode();
  }

  NotusDocument _loadDocument() {
    final Delta delta = Delta()..insert("Start With Your Day!\n");
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
                onChanged: (value) {
                  storyTitle = value;
                },
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
                    autofocus: false,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                vertical: 10,
                horizontal: 10,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    color: Colors.blueAccent,
                  ),
                  Container(
                    child: Text(
                      "Just Post It!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios),
                    onPressed: () {
                      storyDesc = _controller.plainTextEditingValue.text;
                      if (storyTitle != null && storyDesc != null) {
                        storyDetails.add(storyTitle);
                        storyDetails.add(storyDesc);
                        print(storyDetails);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MyApp(),
                          ),
                        );
                      }
                    },
                    color: Colors.blueAccent,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
