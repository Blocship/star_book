import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:star_book/Screens/mood_screen.dart';

class DateScreen extends StatefulWidget {
  @override
  _DateScreenState createState() => _DateScreenState();
}

class _DateScreenState extends State<DateScreen> {
  String label;
  String currentDate = "Current date";
  bool setDate = false;

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
                  SizedBox(
                    height: 10,
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
                          await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(2000),
                            lastDate: DateTime(2100),
                          ).then((value) {
                            setState(() {
                              currentDate = DateFormat.yMMMEd().format(value);
                              setDate = true;
                            });
                          });
                        },
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          size: 35,
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
                      onPressed: () {
                        if (setDate) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MoodScreen(),
                            ),
                          );
                        }
                      },
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
