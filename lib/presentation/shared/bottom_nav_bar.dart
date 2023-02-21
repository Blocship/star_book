import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';

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
    return SafeArea(
      top: false,
      minimum: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
      child: Container(
        width: MediaQuery.of(context).size.width * 0.9,
        height: MediaQuery.of(context).size.height * 0.08,
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Theme.of(context)
                  .extension<ThemeColorStyle>()!
                  .secondaryColor
                  .withOpacity(0.1),
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
              backgroundColor:
                  Theme.of(context).extension<ThemeColorStyle>()!.quinaryColor,
              selectedItemColor: Theme.of(context)
                  .extension<ThemeColorStyle>()!
                  .quaternaryColor,
              unselectedItemColor: Theme.of(context)
                  .extension<ThemeColorStyle>()!
                  .quaternaryColor
                  .withOpacity(0.4),
              selectedLabelStyle:
                  Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: Theme.of(context)
                            .extension<ThemeColorStyle>()!
                            .quaternaryColor,
                      ),
              unselectedLabelStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .quaternaryColor
                          .withOpacity(0.4)),
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
