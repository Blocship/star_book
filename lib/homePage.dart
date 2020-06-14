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
        SizedBox(height: 100),
        Card(
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
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hi how's your day today?",
            style: TextStyle(
              fontSize: 22,
            ),
          ),
          Text(
            "Our Stories",
            style: TextStyle(
              fontSize: 42,
            ),
          ),
          Container(
            height: 500,
            child: Swiper(
              itemCount: highlightedDays.length,
              itemWidth: MediaQuery.of(context).size.width - 2 * 64,
              layout: SwiperLayout.STACK,
              itemBuilder: itemBuilder,
              pagination: SwiperPagination(),
              loop: true,
            ),
          ),
        ],
      ),
    );
  }
}
