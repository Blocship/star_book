part of 'profile_page.dart';

/// Hamburger icon, that navigates to [PreferanceSheet]
class PreferenceButton extends StatelessWidget {
  void onTap(context) {
    Navigator.of(context).pushNamed('preferance');
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(context),
      child: Icon(
        c.CupertinoIcons.bars,
        color: c.CupertinoDynamicColor.resolve(
          c.CupertinoColors.label,
          context,
        ),
      ),
    );
  }
}
