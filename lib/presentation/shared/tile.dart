import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';

class CustomTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final VoidCallback onTap;

  const CustomTile({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return ListTile(
      title: Text(
        title,
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w600,
          color: themeColorStyle.secondaryColor,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
      ),
      trailing: Icon(
        Icons.keyboard_arrow_right,
        color: themeColorStyle.secondaryColor,
      ),
      onTap: onTap,
    );
  }
}

class BlocShipTile extends StatelessWidget {
  const BlocShipTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/icons/blocship_logo.png'),
          width: 16,
        ),
        const SizedBox(width: 6),
        RichText(
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          text: TextSpan(
            text: 'Powered by ',
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
            children: [
              TextSpan(
                text: 'Blocship',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: themeColorStyle.secondaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UxerShipTile extends StatelessWidget {
  const UxerShipTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/icons/ux_logo.png'),
          width: 22,
        ),
        const SizedBox(width: 6),
        RichText(
          textScaleFactor: MediaQuery.of(context).textScaleFactor,
          text: TextSpan(
            text: 'Design & Crafted with ',
            style: textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
            children: [
              WidgetSpan(
                child: Icon(
                  Icons.favorite,
                  color: themeColorStyle.nonaryColor,
                  size: 17,
                ),
              ),
              TextSpan(
                  text: ' by ',
                  style: textTheme.bodyMedium!
                      .copyWith(fontWeight: FontWeight.w400)),
              TextSpan(
                text: 'Uxership',
                style: textTheme.bodyMedium!.copyWith(
                  fontWeight: FontWeight.w400,
                  color: themeColorStyle.secondaryColor,
                  decoration: TextDecoration.underline,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class AppLockTile extends StatefulWidget {
  final String title;

  const AppLockTile({Key? key, required this.title}) : super(key: key);

  @override
  State<AppLockTile> createState() => _AppLockTileState();
}

class _AppLockTileState extends State<AppLockTile> {
  bool isSwitchOn = false;

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final TextTheme textTheme = context.textTheme;
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: themeColorStyle.octonaryColor),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
      child: Row(
        children: [
          Text(
            widget.title,
            style: textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: themeColorStyle.secondaryColor,
            ),
          ),
          const Spacer(),
          Theme(
            data: ThemeData(useMaterial3: true).copyWith(
              colorScheme: Theme.of(context)
                  .colorScheme
                  .copyWith(outline: Colors.transparent),
            ),
            child: SizedBox(
              height: 30,
              width: 38,
              child: FittedBox(
                fit: BoxFit.fill,

                /// Change InActiveTrackColor of Switch
                child: Switch(
                  value: isSwitchOn,
                  trackColor: MaterialStateProperty.resolveWith((states) {
                    if (states.contains(MaterialState.selected)) {
                      return themeColorStyle.senaryColor;
                    }
                    return themeColorStyle.octonaryColor.withOpacity(0.7);
                  }),
                  thumbColor: MaterialStateProperty.all(Colors.white),
                  // inactiveTrackColor: Colors.white,
                  onChanged: (value) {
                    setState(() {
                      isSwitchOn = value;
                    });
                  },
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
