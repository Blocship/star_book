part of 'preference_sheet.dart';

class Privacy extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GroupActionContainer(
          header: 'DATA AND PRIVACY',
          actionList: [
            GroupAction(
              label: 'Export all data',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () {},
            ),
            GroupAction(
              label: 'Erase all data',
              icon: c.CupertinoIcons.right_chevron,
              onTap: () {},
            ),
          ],
        ),
      ],
    );
  }
}
