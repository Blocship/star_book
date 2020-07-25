import 'package:flutter/material.dart';

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Container(),
    );
  }
}
