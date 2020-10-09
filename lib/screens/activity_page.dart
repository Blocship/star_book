import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';

// TODO: display activity in cupertino style,
// added just to implement route,
// will complete it later.
class ActivityPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      navigationBar: c.CupertinoNavigationBar(
        middle: Text('Activity'),
      ),
      child: SafeArea(
        bottom: false,
        child: c.Column(
          crossAxisAlignment: c.CrossAxisAlignment.start,
          children: [
            c.Container(
              padding: c.EdgeInsets.all(16),
              child: c.Row(
                mainAxisAlignment: c.MainAxisAlignment.center,
                children: [
                  c.Text(
                    "07 - 10 - 20",
                    style: c.TextStyle(
                        fontWeight: c.FontWeight.bold, fontSize: 24),
                  ),
                ],
              ),
            ),
            c.Container(
              padding: c.EdgeInsets.all(16),
              child: c.Text("Happy"),
            ),
            c.Container(
              padding: c.EdgeInsets.all(16),
              child: c.Text("Title"),
            ),
            c.Container(
              padding: c.EdgeInsets.all(16),
              child: c.Text("Note: \n\nLorem Ipsum is simply dummy text of the printing and typesetting industry." +
                  " Lorem Ipsum has been the industry's standard dummy text ever since the 1500s," +
                  " when an unknown printer took a galley of type and scrambled it to make a type specimen book." +
                  " It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. " +
                  " It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages," +
                  " and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
            ),
          ],
        ),
      ),
    );
  }
}
