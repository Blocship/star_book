import 'package:flutter/material.dart';

class StoryScreen extends StatefulWidget {
  @override
  _StoryScreenState createState() => _StoryScreenState();
}

class _StoryScreenState extends State<StoryScreen> {
  String label;
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
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        child: Stack(
          fit: StackFit.loose,
          children: [
            Slider(
              min: 0,
              max: 4,
              value: _value,
              onChanged: (value) {
                setState(() {
                  _value = value;
                  _getLabel(_value);
                });
              },
              divisions: 4,
              label: label,
            ),
          ],
        ),
      ),
    );
  }
}
