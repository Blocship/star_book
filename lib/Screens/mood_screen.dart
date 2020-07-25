import 'package:flutter/material.dart';

class MoodScreen extends StatefulWidget {
  @override
  _MoodScreenState createState() => _MoodScreenState();
}

class _MoodScreenState extends State<MoodScreen> {
  var _value = 2.0;

  String label = "neutral";

  String _getLabel(double index) {
    if (_value == 0.0)
      return label = "awful";
    else if (_value == 1.0)
      return label = "sad";
    else if (_value == 2.0)
      return label = "neutral";
    else if (_value == 3.0)
      return label = "happy";
    else if (_value == 4.0)
      return label = "productive";
    else
      return label = "No Mood";
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
              margin: EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 200,
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.blue[500],
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 12),
                        thumbColor: Colors.blue[800],
                        inactiveTrackColor: Colors.blue[200],
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 18),
                        overlayColor: Colors.blue[900].withOpacity(0.5)),
                    child: Slider(
                      value: _value,
                      min: 0.0,
                      max: 4.0,
                      onChanged: (value) {
                        setState(() {
                          _value = value;
                          _getLabel(value);
                        });
                      },
                      divisions: 4,
                    ),
                  ),
                  SizedBox(
                    height: 50,
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
