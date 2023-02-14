import 'package:flutter/material.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class AppBarItem {
  final String? label;
  final IconData? icon;
  final VoidCallback? onTap;

  AppBarItem({
    this.label,
    this.icon,
    this.onTap,
  });
}

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final AppBarItem? leading;
  final String? center;
  final AppBarItem? trailing;

  const CustomAppBar({
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
            top: 50,
            left: 0,
            child: _Leading(leading: leading),
          ),
          Positioned(
            top: 50,
            child: _Title(title: center),
          ),
          Positioned(
            top: 54,
            right: 0,
            child: _Trailing(trailing: trailing),
          ),
        ],
      ),
    );
  }
}

class _Leading extends StatelessWidget {
  final AppBarItem? leading;

  const _Leading({this.leading});

  @override
  Widget build(BuildContext context) {
    if (leading == null) return const SizedBox();

    return GestureDetector(
      onTap: leading?.onTap,
      child: Row(
        children: [
          const Icon(
            Icons.keyboard_arrow_left_outlined,
            size: 24,
            color: Color(0xFF1F1F1F),
          ),
          if (leading!.label != null)
            Text(
              leading!.label!,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF1F1F1F),
                  ),
            ),
        ],
      ),
    );
  }
}

class _Trailing extends StatelessWidget {
  final AppBarItem? trailing;

  const _Trailing({this.trailing});

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
                    color: const Color(0xFF1F1F1F),
                  ),
            )
          : const SizedBox(),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;

  const _Title({required this.title});

  @override
  Widget build(BuildContext context) {
    if (title == null) return const SizedBox();

    return Text(
      title ?? '',
      style: Theme.of(context).textTheme.headlineSmall!.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}
