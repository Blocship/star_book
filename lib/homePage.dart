import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:star_book/models/activity.dart';

class HomePage extends StatefulWidget {
  final Function onTap;
  final selectedIndex;

  HomePage({this.onTap, this.selectedIndex});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Activity> highlightedDays = [
    new Activity(day: 1, mood: "green", story: "I had a very happy day"),
    new Activity(day: 3, mood: "blue", story: "My day was normal"),
    new Activity(day: 4, mood: "red", story: "I was very angry today"),
  ];

  Widget itemBuilder(BuildContext context, int index) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 8,
      color: Colors.blue,
      child: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(
          children: <Widget>[
            Text(
              highlightedDays[index].day.toString(),
              style: TextStyle(fontSize: 44),
              textAlign: TextAlign.left,
            ),
            Text(
              highlightedDays[index].mood,
              style: TextStyle(fontSize: 32),
              textAlign: TextAlign.left,
            ),
            Text(
              highlightedDays[index].story,
              style: TextStyle(fontSize: 22),
              textAlign: TextAlign.left,
            ),
            SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                      height: 20,
                    ),
                    IconButton(
                      icon: Icon(Icons.settings),
                      onPressed: () {},
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.add,
                        color: Colors.blue,
                      ),
                      onPressed: () {},
                    )
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.only(top: 40, right: 50),
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/user.png'),
                ),
              ),
            ),
            Positioned(
              child: Text(
                "Good Morning Dear ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              top: MediaQuery.of(context).size.height / 5,
              right: 50,
            ),
            Positioned(
              child: Text(
                "Hi how's your day today?",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              top: MediaQuery.of(context).size.height / 4,
              right: 50,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 500,
                child: Swiper(
                  onTap: (index) {
                    print(index);
                  },
                  scrollDirection: Axis.horizontal,
                  itemCount: highlightedDays.length,
                  itemWidth: MediaQuery.of(context).size.width - 88,
                  itemHeight: MediaQuery.of(context).size.height / 2,
                  layout: SwiperLayout.STACK,
                  itemBuilder: itemBuilder,
                  pagination: SwiperPagination(),
                  loop: true,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
