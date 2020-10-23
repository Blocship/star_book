import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../utils/color.dart';
import '../widgets/color_container.dart';
import '../models/mood.dart';

class MoodSheet extends StatelessWidget {
  c.CupertinoNavigationBar _buildNavBar(BuildContext context) {
    return c.CupertinoNavigationBar(
      backgroundColor: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.systemGrey6, context),
      middle: Text("Mood"),
      border: null,
    );
  }

  SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ...mMoodList.map((e) {
            return Column(
              children: [
                ColorContainer(
                  text: e.label,
                  color: getColor(EColor.values[e.colorCode]),
                  onTap: () {
                    Navigator.of(context).pop(e.id);
                  },
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 6)),
              ],
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
        c.CupertinoColors.systemGrey6,
        context,
      ),
      navigationBar: _buildNavBar(context),
      child: _buildBody(context),
    );
  }
}
