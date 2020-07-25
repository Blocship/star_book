import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  static String id = 'ActivityScreen';
  final mood;

  ActivityScreen(this.mood);

  @override
  _ActivityScreenState createState() => _ActivityScreenState(mood);
}

class _ActivityScreenState extends State<ActivityScreen> {
  String mood;

  _ActivityScreenState(this.mood);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          fit: StackFit.loose,
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 50, horizontal: 30),
              child: Hero(
                tag: 'UserIcon',
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: AssetImage('images/user.png'),
                ),
              ),
            ),
            Positioned(
              child: Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "What made you feel $mood?",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              top: 160,
              left: 20,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
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
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {},
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
