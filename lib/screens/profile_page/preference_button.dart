part of 'profile_page.dart';

/// Hamburger icon, that navigates to [PreferanceSheet]
class PreferenceButton extends StatelessWidget {
  void onTap(context) {
    Navigator.of(context).pushNamed(PreferenceRouteInitializer.Preference);
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: () => onTap(context),
      child: Container(
        height: 44,
        width: 44,
        alignment: Alignment.centerRight,
        child: Icon(
          c.CupertinoIcons.bars,
          size: 32,
          color: c.CupertinoDynamicColor.resolve(
            c.CupertinoColors.label,
            context,
          ),
        ),
      ),
    );
  }
}
