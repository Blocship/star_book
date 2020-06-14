import 'package:flutter/material.dart';

class ModePicker extends StatefulWidget {
  ModePicker({Key key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ModePickerState();
}

class _ModePickerState extends State<ModePicker> {
  String label = '';
  double _value = 1.0;
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

  String _getLabel(BuildContext context) {
    if (_value == 1)
      return "sad";
    else if (_value == 2)
      return "average";
    else if (_value == 3)
      return "happy";
    else if (_value == 4)
      return "productive";
    else
      return null;
  }

  void _onSliderChanged(value) {
    setState(() {
      _value = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.all(30),
      color: Colors.blue[100],
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.transparent,
            height: 100,
          ),
          Container(
            color: Colors.transparent,
            height: 30,
            child: Text('How was your day today?',
                style: TextStyle(fontSize: 25, color: Colors.white)),
          ),
          Container(
            color: Colors.transparent,
            height: 20,
          ),
          Container(
            color: Colors.transparent,
            height: 125,
            child: _getIcon(context),
          ),
          Container(
            color: Colors.transparent,
            height: 20,
          ),
          Container(
            color: Colors.transparent,
            height: 100,
            child: Slider(
              min: 0,
              max: 4,
              value: _value,
              onChanged: _onSliderChanged,
              divisions: 4,
              label: _getLabel(context),
            ),
          ),
        ],
      ),
    );
  }
}
