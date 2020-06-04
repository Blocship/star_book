import 'package:flutter/material.dart';
import 'package:star_book/models/activity.dart';

class DayDetailPage extends StatefulWidget {
  final Activity data;
  DayDetailPage({Key key, this.data}) : super(key: key);

  @override
  _DayDetailPageState createState() => _DayDetailPageState();
}

class _DayDetailPageState extends State<DayDetailPage> {
  bool edit = false;
  String dropdownValue = 'red';

  void onEditPressed() {
    if (edit) {
      Navigator.pop(context, dropdownValue);
    }
    setState(() {
      edit = !edit;
    });
  }

  void onTagChanged(String newValue) {
    setState(() {
      dropdownValue = newValue;
    });
  }

  Widget displayDetail(BuildContext context) {
    return Column(
      children: <Widget>[
        Text("${widget.data.day}"),
        Text("${widget.data.tag}"),
        Text("${widget.data.detail}"),
      ],
    );
  }

  Widget editDetail(BuildContext context) {
    return Column(
      children: <Widget>[
        DropdownButton<String>(
          value: dropdownValue,
          elevation: 16,
          onChanged: onTagChanged,
          items: <String>['red', 'blue', 'green']
              .map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("day ${widget.data.day} Tag: ${widget.data.tag}"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: onEditPressed,
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: onEditPressed,
              child: Text(!edit ? "Edit" : "Done"),
            ),
            !edit ? displayDetail(context) : editDetail(context),
          ],
        ),
      ),
    );
  }
}
