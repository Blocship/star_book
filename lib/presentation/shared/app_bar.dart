import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String? leadingText;
  final IconData? icon;
  final String? centerTitle;
  final String? trailingText;
  final VoidCallback? leadingOnTap;
  final VoidCallback? trailingOnTap;

  const PrimaryAppBar({
    super.key,
    this.leadingText,
    this.icon,
    this.centerTitle,
    this.trailingText,
    this.leadingOnTap,
    this.trailingOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: leadingOnTap,
          child: Row(
            children: [
              Icon(
                icon,
                size: 24,
                color: Theme.of(context)
                    .extension<ThemeColorStyle>()!
                    .secondaryColor,
              ),
              Text(
                leadingText ?? '',
                style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .secondaryColor,
                    ),
              ),
            ],
          ),
        ),
        centerTitle: true,
        title: Text(
          centerTitle ?? '',
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: Theme.of(context)
                    .extension<ThemeColorStyle>()!
                    .secondaryColor,
              ),
        ),
        actions: [
          Padding(
              padding: const EdgeInsets.only(top: 20),
              child: GestureDetector(
                onTap: trailingOnTap,
                child: Text(
                  trailingText ?? '',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontWeight: FontWeight.w400,
                        color: Theme.of(context)
                            .extension<ThemeColorStyle>()!
                            .secondaryColor,
                      ),
                ),
              )),
        ],
      ),
    );
  }

  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
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
            icon: Icon(trailing,
                size: 24,
                color: Theme.of(context)
                    .extension<ThemeColorStyle>()!
                    .secondaryColor),
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
