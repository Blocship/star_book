import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../utils/color.dart';
import '../widgets/color_container.dart';
import '../models/mood.dart';

class MoodSheet extends StatelessWidget {
  c.CupertinoNavigationBar _buildNavBar() {
    return c.CupertinoNavigationBar(
      middle: Text("Mood"),
      leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text("back")),
      trailing: null,
      border: null,
    );
  }

  c.SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 16),
      child: c.Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ...mMoodList.map((e) {
            return ColorContainer(
              text: e.label,
              color: getColor(EColor.values[e.colorCode]),
              // TODO: add keys
              // On Tap functionality
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemGroupedBackground,
      navigationBar: _buildNavBar(),
      child: _buildBody(context),
    );
  }
}
