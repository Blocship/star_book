import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../utils/bottom_sheet.dart';

class PreferanceSheet extends StatelessWidget {
  c.CupertinoNavigationBar _buildNavBar() {
    return c.CupertinoNavigationBar(
      middle: Text("dataa"),
      leading: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          child: Text("data")),
      trailing: null,
      border: null,
    );
  }

  c.SafeArea _buildBody() {
    return SafeArea(
      minimum: EdgeInsets.symmetric(horizontal: 16),
      child: c.Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 14)),
          textContainer('Edit Mood'),
          Padding(padding: EdgeInsets.symmetric(vertical: 14)),
          textContainer('About Developer'),
          Padding(padding: EdgeInsets.symmetric(vertical: 14)),
          textContainer('Privacy and Terms'),
          Padding(padding: EdgeInsets.symmetric(vertical: 14)),
          textContainer('LICENCE'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemGrey6,
      navigationBar: _buildNavBar(),
      child: _buildBody(),
    );
  }
}
