part of 'preference_sheet.dart';

class AboutDeveloper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _textWidth = MediaQuery.of(context).size.width * 0.6 - 29;
    double _imageWidth = MediaQuery.of(context).size.width * 0.4 - 29;
    return Column(
      crossAxisAlignment: c.CrossAxisAlignment.start,
      children: [
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
          ),
        ),
      ],
    );
  }
}
