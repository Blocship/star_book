import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? leadingText;
  final String? centerTitle;
  final String? trailingText;
  final VoidCallback? leadingOnTap;
  final VoidCallback? trailingOnTap;
  final bool isBottomSheet;
  const PrimaryAppBar({
    super.key,
    this.leadingText,
    this.centerTitle,
    this.trailingText,
    this.leadingOnTap,
    this.trailingOnTap,
    this.isBottomSheet = false,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;

    return Padding(
      padding: isBottomSheet
          ? const EdgeInsets.fromLTRB(20, 54, 20, 0)
          : const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leadingWidth: deviceWidth * 0.175,
        leading: GestureDetector(
          onTap: leadingOnTap,
          child: Row(
            children: [
              Icon(
                Icons.keyboard_arrow_left_outlined,
                size: 24,
                color: themeColorStyle.secondaryColor,
              ),
              Text(
                leadingText ?? 'Back',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: themeColorStyle.secondaryColor,
                ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          centerTitle ?? '',
          style: textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color: themeColorStyle.secondaryColor,
          ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: trailingOnTap,
                child: Text(
                  trailingText ?? '',
                  style: textTheme.bodyMedium!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: themeColorStyle.secondaryColor,
                  ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return Size.fromHeight(isBottomSheet ? 80 : 50);
  }
}

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget leading;
  final IconData trailing;
  final VoidCallback trailingOnTap;

  const SecondaryAppBar({
    super.key,
    required this.leading,
    required this.trailing,
    required this.trailingOnTap,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: leading,
        leadingWidth: 24,
        actions: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            onPressed: trailingOnTap,
            icon:
                Icon(trailing, size: 24, color: themeColorStyle.secondaryColor),
          )
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
  }
}
