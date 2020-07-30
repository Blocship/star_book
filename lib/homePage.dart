import 'dart:io';
import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:star_book/models/activity.dart';
import 'package:star_book/widgets/story_card.dart';

import 'Screens/date_screen.dart';
import 'models/activity.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var user = 'Dear';

  int _index = 0;

  Widget itemBuilder(BuildContext context, int index) {
    if (index == 0) {
      return FirstStoryCard();
    } else {
      return OtherStoryCard(activity: highlightedDays[index]);
    }
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
                    onPressed: () {},
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
                    onPressed: () {
                      if (_index == 0) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DateScreen(),
                          ),
                        );
                      }
                    },
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
                      radius: 50,
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                  ),
                  Text(
                    "Good Morning $user",
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
                  _index = index;
                  if (index == 0) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DateScreen(),
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
