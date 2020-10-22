import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
// Files
import '../widgets/action_container.dart';
import '../widgets/my_container.dart';
import '../styles/style.dart';

class PreferanceSheet extends StatelessWidget {
  c.CupertinoNavigationBar _buildNavBar() {
    return c.CupertinoNavigationBar(
      middle: Text("StarBook"),
      trailing: null,
      border: null,
    );
  }

  List<Widget> _aboutDeveloper(BuildContext context) {
    double _textWidth = MediaQuery.of(context).size.width * 0.6 - 29;
    double _imageWidth = MediaQuery.of(context).size.width * 0.4 - 29;
    return [
      Container(
        padding: EdgeInsets.fromLTRB(29, 17, 0, 8),
        child: Text(
          "ABOUT THE DEVELOPER",
          style: Style.footerNoteSecondary(context),
        ),
      ),
      MyContainer(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: _textWidth,
            child: Text(
              "I'm Hashir, the developer of this app. Feel free to contact me anytime. I love hearing from you",
              style: Style.body(context),
            ),
          ),
          Container(
            width: _imageWidth,
            height: _imageWidth,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_imageWidth / 2),
              image: DecorationImage(
                image: AssetImage("dev-profile.jpeg"),
              ),
            ),
          ),
        ],
      ))
    ];
  }

  c.SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ActionContainer(
            text: 'Edit Mood',
            icon: c.CupertinoIcons.right_chevron,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ..._aboutDeveloper(context),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ActionContainer(
            text: 'Privacy and Terms',
            icon: c.CupertinoIcons.right_chevron,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          ActionContainer(
            text: 'LICENCE',
            icon: c.CupertinoIcons.right_chevron,
            onTap: () async {
              String url =
                  "https://github.com/hashirshoaeb/star_book/blob/master/LICENSE";
              try {
                if (await canLaunch(url)) await launch(url);
              } catch (e) {
                // print("Url Exception , ${e.toString()}");
              }
            },
          ),
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
