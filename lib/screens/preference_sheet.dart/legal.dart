part of 'preference_sheet.dart';

class Legal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          padding: EdgeInsets.fromLTRB(29, 17, 0, 8),
          child: Text(
            "LEGAL",
            style: Style.footerNoteSecondary(context),
          ),
        ),
        ActionContainer(
          text: 'Acknowledgement',
          icon: c.CupertinoIcons.right_chevron,
          onTap: () async {
            Navigator.of(context).pushNamed('preference/acknowledgement');
          },
        ),
        ActionContainer(
          text: 'Privacy and Terms',
          icon: c.CupertinoIcons.right_chevron,
          onTap: () async {
            String url = "https://github.com/hashirshoaeb/star_book/blob/master/PRIVACY%26POLICY.md";
            try {
              if (await canLaunch(url)) await launch(url);
            } catch (e) {
              // print("Url Exception , ${e.toString()}");
            }
          },
        ),
        // Padding(padding: EdgeInsets.symmetric(vertical: 8)),
        ActionContainer(
          text: 'LICENCE',
          icon: c.CupertinoIcons.right_chevron,
          onTap: () async {
            String url = "https://github.com/hashirshoaeb/star_book/blob/master/LICENSE";
            try {
              if (await canLaunch(url)) await launch(url);
            } catch (e) {
              // print("Url Exception , ${e.toString()}");
            }
          },
        ),
      ],
    );
  }
}
