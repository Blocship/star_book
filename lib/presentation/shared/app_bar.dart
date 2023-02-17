import 'package:flutter/material.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';

class PrimaryAppBarItem {
  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;

  PrimaryAppBarItem({
    this.label,
    this.icon,
    this.onTap,
  });
}

class PrimaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final PrimaryAppBarItem? leading;
  final String? center;
  final PrimaryAppBarItem? trailing;

  const PrimaryAppBar({
    super.key,
    this.leading,
    this.center,
    this.trailing,
  });

  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 55,
            left: 0,
            child: _PrimaryLeading(leading: leading),
          ),
          Positioned(
            top: 56,
            child: _PrimaryTitle(title: center),
          ),
          Positioned(
            top: 54,
            right: 0,
            child: _PrimaryTrailing(trailing: trailing),
          ),
        ],
      ),
    );
  }
}

class _PrimaryLeading extends StatelessWidget {
  final PrimaryAppBarItem? leading;

  const _PrimaryLeading({this.leading});

  @override
  Widget build(BuildContext context) {
    if (leading == null) return const SizedBox();

    return GestureDetector(
      onTap: leading?.onTap,
      child: Row(
        children: [
          Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 24,
            color:
                Theme.of(context).extension<ThemeColorStyle>()!.secondaryColor,
          ),
          if (leading!.label != null)
            Text(
              leading!.label!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor,
                  ),
            ),
        ],
      ),
    );
  }
}

class _PrimaryTrailing extends StatelessWidget {
  final PrimaryAppBarItem? trailing;

  const _PrimaryTrailing({this.trailing});

  @override
  Widget build(BuildContext context) {
    if (trailing == null) return const SizedBox();
    return GestureDetector(
      onTap: trailing?.onTap,
      child: (trailing!.label != null)
          ? Text(
              trailing!.label!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor,
                  ),
            )
          : const SizedBox(),
    );
  }
}

class _PrimaryTitle extends StatelessWidget {
  final String? title;

  const _PrimaryTitle({required this.title});

  @override
  Widget build(BuildContext context) {
    if (title == null) return const SizedBox();

    return Text(
      title ?? '',
      style: Theme.of(context).textTheme.bodyLarge!.copyWith(
            fontWeight: FontWeight.w700,
            color:
                Theme.of(context).extension<ThemeColorStyle>()!.secondaryColor,
          ),
    );
  }
}

class SecondaryAppBarItem {
  final Widget? icon;
  final VoidCallback? onTap;

  SecondaryAppBarItem({
    this.icon,
    this.onTap,
  });
}

class SecondaryAppBar extends StatelessWidget implements PreferredSizeWidget {
  final SecondaryAppBarItem? leadingIcon;
  final SecondaryAppBarItem? trailingIcon;

  const SecondaryAppBar({
    super.key,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Size get preferredSize {
    return const Size.fromHeight(50);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
          const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
      child: Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: [
          Positioned(
            top: 50,
            left: 0,
            child: _SecondaryLeading(leadingIcon: leadingIcon),
          ),
          Positioned(
            top: 54,
            right: 0,
            child: _SecondaryTrailing(trailingIcon: trailingIcon),
          ),
        ],
      ),
    );
  }
}

class _SecondaryLeading extends StatelessWidget {
  final SecondaryAppBarItem? leadingIcon;

  const _SecondaryLeading({this.leadingIcon});

  @override
  Widget build(BuildContext context) {
    if (leadingIcon == null) return const SizedBox();

    return (leadingIcon!.icon != null)
        ? SizedBox(
            width: 24,
            height: 24,
            child: leadingIcon!.icon!,
          )
        : const SizedBox();
  }
}

class _SecondaryTrailing extends StatelessWidget {
  final SecondaryAppBarItem? trailingIcon;

  const _SecondaryTrailing({this.trailingIcon});

  @override
  Widget build(BuildContext context) {
    if (trailingIcon == null) return const SizedBox();
    return GestureDetector(
      onTap: trailingIcon?.onTap,
      child: (trailingIcon!.icon != null)
          ? SizedBox(
              width: 24,
              height: 24,
              child: trailingIcon!.icon!,
            )
          : const SizedBox(),
    );
  }
}
