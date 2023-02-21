import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final List<BottomNavigationBarItem> items;
  final ValueChanged<int> onTap;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final TextStyle? selectedLabelStyle;
  final TextStyle? unselectedLabelStyle;
  final Color? backgroundColor;

  const BottomNavBar({
    Key? key,
    required this.currentIndex,
    required this.items,
    required this.onTap,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    final double deviceWidth = context.deviceWidth;
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
        width: deviceWidth * 0.9,
        height: deviceHeight * 0.08,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: themeColorStyle.secondaryColor.withOpacity(0.1),
              blurRadius: 100,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              backgroundColor: themeColorStyle.quinaryColor,
              selectedItemColor: themeColorStyle.quaternaryColor,
              unselectedItemColor:
                  themeColorStyle.quaternaryColor.withOpacity(0.4),
              selectedLabelStyle: textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w500,
                color: themeColorStyle.quaternaryColor,
              ),
              unselectedLabelStyle: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: themeColorStyle.quaternaryColor.withOpacity(0.4)),
              currentIndex: currentIndex,
              onTap: onTap,
              items: items,
            ),
          ),
        ),
      ),
    );
  }
}
