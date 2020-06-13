import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:star_book/models/activity.dart';

class HomePage extends StatefulWidget {
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
    return Column(
      children: <Widget>[
        Text(
          "Hello",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "Hello",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "Hello",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "Hello",
          style: TextStyle(fontSize: 40),
        ),
        Text(
          "Hello",
          style: TextStyle(fontSize: 40),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Text(
            "Hi how's your day today?",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Swiper(
            itemCount: highlightedDays.length,
            itemWidth: MediaQuery.of(context).size.width,
            itemHeight: MediaQuery.of(context).size.height - 400,
            layout: SwiperLayout.STACK,
            itemBuilder: itemBuilder,
            pagination: SwiperPagination(),
            loop: false,
          ),
        ],
      ),
    );
  }
}
