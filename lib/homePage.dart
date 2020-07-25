import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:star_book/Screens/story_screen.dart';
import 'package:star_book/models/activity.dart';

class HomePage extends StatefulWidget {
  final openDrawer;

  HomePage(this.openDrawer);

  @override
  _HomePageState createState() => _HomePageState(openDrawer);
}

class _HomePageState extends State<HomePage> {
  final Function openDrawer;

  _HomePageState(this.openDrawer);

  List<Activity> get reversedList {
    return highlightedDays.reversed.toList();
  }

  List<Activity> highlightedDays = [
    new Activity(
      icon: FontAwesomeIcons.pencilAlt,
      mood: "white",
      story: "Write Your Story!",
      color: Colors.black54.withOpacity(0.75),
      size: 100,
    ),
    new Activity(
      icon: FontAwesomeIcons.smile,
      mood: "green",
      story: "I had a very happy day",
      color: Colors.green,
      size: 120,
    ),
    new Activity(
      icon: FontAwesomeIcons.laughSquint,
      mood: "green",
      story: "I had a very happy day",
      color: Colors.yellow,
      size: 120,
    ),
  ];

  Widget itemBuilder(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      color: highlightedDays[index].color,
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
                highlightedDays[index].icon,
                size: highlightedDays[index].size,
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
                highlightedDays[index].story,
                style: TextStyle(fontSize: 22, color: Colors.white),
                textAlign: TextAlign.left,
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              height: double.infinity,
              width: 100,
              decoration: BoxDecoration(
                color: Color(0xFFedf6fd),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Platform.isAndroid ? 20 : 40,
                  ),
                  IconButton(
                    icon: Icon(Icons.settings),
                    onPressed: openDrawer,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.add,
                      color: Colors.blue,
                      size: 25,
                    ),
                    onPressed: () {},
                  )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              width: MediaQuery.of(context).size.width / 1.7,
              height: MediaQuery.of(context).size.height / 3.5,
              margin: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Hero(
                    tag: 'UserIcon',
                    child: CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                  ),
                  Text(
                    "Good Morning Dear ",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  Text(
                    "Hi how's your day today?",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: MediaQuery.of(context).size.height / 1.7,
              child: Swiper(
                onTap: (index) {
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => StoryScreen(),
                      ),
                    );
                  }
                },
                itemCount: highlightedDays.length,
                itemWidth: MediaQuery.of(context).size.width - 88,
                itemHeight: MediaQuery.of(context).size.height / 1.8,
                layout: SwiperLayout.STACK,
                itemBuilder: itemBuilder,
                loop: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
