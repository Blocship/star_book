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
      border: null,
    );
  }

  c.SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: c.Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ...mMoodList.map((e) {
            return ColorContainer(
              text: e.label,
              color: getColor(EColor.values[e.colorCode]),
              onTap: () {
                Navigator.of(context).pop(e.id);
              },
            );
          }),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoDynamicColor.resolve(
        c.CupertinoColors.systemBackground,
        context,
      ),
      navigationBar: _buildNavBar(),
      child: _buildBody(context),
    );
  }
}
