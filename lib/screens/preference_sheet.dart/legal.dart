part of 'preference_sheet.dart';

class Legal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GroupActionContainer(
          header: 'LEGAL',
          actionList: [
            GroupAction(
              label: 'Acknowledgement',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () async {
                Navigator.of(context).pushNamed(AcknowledgementSheet.Acknowledgement);
              },
            ),
            GroupAction(
              label: 'Privacy and Terms',
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
            GroupAction(
              label: 'LICENCE',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () async {
                String url = "https://github.com/hashirshoaeb/star_book/blob/master/LICENSE";
                try {
                  if (await canLaunch(url)) await launch(url);
                } catch (e) {
                  // print("Url Exception , ${e.toString()}");
                }
              },
            )
          ],
        ),
      ],
    );
  }
}
