import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:star_book/models/activity.dart';

import 'activity_screen.dart';

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  var _value = 2.0;

  String label = "neutral";

  IconData _iconData = FontAwesomeIcons.meh;

  String _getLabel(double index) {
    if (_value == 0.0)
      return label = "awful";
    else if (_value <= 1.0)
      return label = "sad";
    else if (_value <= 2.0)
      return label = "neutral";
    else if (_value <= 3.0)
      return label = "happy";
    else if (_value <= 4.0)
      return label = "productive";
    else
      return label = "No Mood";
  }

  IconData _getIcon(double index) {
    if (_value == 0.0)
      return _iconData = FontAwesomeIcons.tired;
    else if (_value <= 1.0)
      return _iconData = FontAwesomeIcons.frown;
    else if (_value <= 2.0)
      return _iconData = FontAwesomeIcons.meh;
    else if (_value <= 3.0)
      return _iconData = FontAwesomeIcons.smile;
    else if (_value <= 4.0)
      return _iconData = FontAwesomeIcons.grinSquint;
    else
      return _iconData = FontAwesomeIcons.mehBlank;
  }

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
                  "How was your Day Today?",
                  style: TextStyle(fontSize: 23),
                ),
              ),
              top: 160,
              left: 20,
            ),
            Container(
              margin:
                  EdgeInsets.only(top: 200, bottom: 16, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  Icon(_iconData, size: MediaQuery.of(context).size.height / 4),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.blue[500],
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12),
                      thumbColor: Colors.blue[800],
                      inactiveTrackColor: Colors.blue[200],
                      overlayShape: RoundSliderOverlayShape(overlayRadius: 18),
                      overlayColor: Colors.blue[900].withOpacity(0.5),
                    ),
                    child: Slider(
                      value: _value,
                      min: 0.0,
                      max: 4.0,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _getLabel(value);
                          _getIcon(value);
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 16,
                  ),
                  Text(
                    label,
                    style: TextStyle(fontSize: 25),
                  ),
                ],
              ),
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
                      onPressed: () {
                        storyDetails.add(label);
                        storyDetails.add(_iconData);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ActivityScreen(label),
                          ),
                        );
                      },
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
