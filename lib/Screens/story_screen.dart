import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/rounded_picker.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  String label;
  String currentDate = "Current date";
  double _value = 2.0;
  List<String> modes = ['Routine', 'Happy', 'sad', 'angry', 'normal'];

  Widget _getIcon(BuildContext context) {
    if (_value == 1)
      return Icon(Icons.child_care, size: 130, color: Colors.red[200]);
    else if (_value == 2)
      return Icon(Icons.child_care, size: 130, color: Colors.green[200]);
    else if (_value == 3)
      return Icon(Icons.child_care, size: 130, color: Colors.green[500]);
    else if (_value == 4)
      return Icon(Icons.child_care, size: 130, color: Colors.orange[300]);
    else
      return Icon(Icons.child_care, size: 130, color: Colors.white);
  }

  String _getLabel(double index) {
    if (_value == 0.0)
      return label = "very sad";
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
  void initState() {
    // TODO: implement initState
    _getLabel(_value);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Container(
          width: double.infinity,
          child: Stack(
            fit: StackFit.loose,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 8),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.close),
                ),
              ),
              Container(
                margin: EdgeInsets.all(100),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: Hero(
                    tag: 'UserIcon',
                    child: CircleAvatar(
                      radius: 70,
                      backgroundImage: AssetImage('images/user.png'),
                    ),
                  ),
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RichText(
                    text: TextSpan(
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                      children: [
                        TextSpan(text: 'Good Morning, '),
                        TextSpan(
                          text: 'Username',
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Ready To Create A",
                    style: TextStyle(fontSize: 25),
                  ),
                  Text(
                    "Story?",
                    style: TextStyle(fontSize: 25),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        currentDate,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 25),
                      ),
                      GestureDetector(
                        onTap: () async {
                          DateTime newDateTime = await showRoundedDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(DateTime.now().year - 1),
                            lastDate: DateTime(DateTime.now().year + 1),
                            borderRadius: 16,
                          );
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 64, horizontal: 8),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    margin: EdgeInsets.all(20),
                    width: double.infinity,
                    child: MaterialButton(
                      padding: EdgeInsets.symmetric(vertical: 18),
                      color: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100)),
                      onPressed: () {},
                      child: Text(
                        "LET'S DO IT",
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
