import 'package:flutter/material.dart';

class FirstStoryCard extends StatelessWidget {
  final activity;

  FirstStoryCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      color: activity.color,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                activity.icon,
                size: activity.size,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 100),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                activity.story,
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class OtherStoryCard extends StatelessWidget {
  final activity;

  OtherStoryCard({this.activity});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      color: activity.color,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 80),
            child: Align(
              alignment: Alignment.topCenter,
              child: Icon(
                activity.icon,
                size: activity.size,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            height: double.infinity,
            width: double.infinity,
            padding: EdgeInsets.only(top: 100),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                activity.story,
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
