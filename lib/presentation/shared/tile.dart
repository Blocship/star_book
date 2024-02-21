import 'dart:developer';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:url_launcher/url_launcher_string.dart';

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

class BlocShipTile extends StatefulWidget {
  const BlocShipTile({Key? key}) : super(key: key);

  @override
  State<BlocShipTile> createState() => _BlocShipTileState();
}

class _BlocShipTileState extends State<BlocShipTile> {
  late TapGestureRecognizer _onTapRecognizerBlocship;

  @override
  void initState() {
    super.initState();
    _onTapRecognizerBlocship = TapGestureRecognizer()
      ..onTap = _openBlocshipLink;
  }

  @override
  void dispose() {
    super.dispose();
    _onTapRecognizerBlocship.dispose();
  }

  void _openBlocshipLink() async {
    const link = 'https://blocship.io/';

    try {
      await launchUrlString(link, mode: LaunchMode.inAppWebView);
    } on Exception catch (e) {
      log('Failed to launch link $link: $e');
    }
  }

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
                recognizer: _onTapRecognizerBlocship,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class UxerShipTile extends StatefulWidget {
  const UxerShipTile({Key? key}) : super(key: key);

  @override
  State<UxerShipTile> createState() => _UxerShipTileState();
}

class _UxerShipTileState extends State<UxerShipTile> {
  late TapGestureRecognizer _onTapRecognizerUxership;

  @override
  void initState() {
    super.initState();
    _onTapRecognizerUxership = TapGestureRecognizer()
      ..onTap = _openUxershipLink;
  }

  @override
  void dispose() {
    super.dispose();
    _onTapRecognizerUxership.dispose();
  }

  void _openUxershipLink() async {
    const link = 'https://blocship.io/';

    try {
      await launchUrlString(link, mode: LaunchMode.inAppWebView);
    } on Exception catch (e) {
      print('Failed to launch link $link: $e');
    }
  }

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
                recognizer: _onTapRecognizerUxership,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
