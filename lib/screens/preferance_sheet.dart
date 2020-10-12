import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/material.dart' show Theme;
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';
// Files
import '../utils/bottom_sheet.dart';
import '../widgets/action_container.dart';

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
          style: Theme.of(context).textTheme.caption,
        ),
      ),
      textContainer(
          context: context,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              c.Container(
                width: _textWidth,
                child: Text(
                  "I'm Hashir, the developer of this app. Feel free to contact me anytime. I love hearing from you",
                ),
              ),
              c.Container(
                width: _imageWidth,
                height: _imageWidth,
                decoration: c.BoxDecoration(
                  borderRadius: BorderRadius.circular(_imageWidth / 2),
                  image: c.DecorationImage(
                    image: c.NetworkImage(
                        "https://avatars0.githubusercontent.com/u/35165481?s=$_imageWidth + 29"),
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
      child: c.Column(
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
              if (await canLaunch(url)) await launch(url);
              // else TODO: handle exception
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
