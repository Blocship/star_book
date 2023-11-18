import 'dart:io';

import 'package:flutter/material.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:url_launcher/url_launcher.dart';

class ForceAppUpdateDialog extends StatelessWidget {
  const ForceAppUpdateDialog({super.key});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    return Center(
      child: SizedBox(
        height: deviceHeight * 0.35,
        child: Dialog(
          elevation: 0,
          insetPadding: const EdgeInsets.symmetric(horizontal: 22),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Column(
              children: [
                const SizedBox(height: 30),
                const Icon(Icons.update, size: 50),
                const SizedBox(height: 30),
                Text(
                  'App Update Available',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: themeColorStyle.secondaryColor),
                ),
                const SizedBox(height: 10),
                Text(
                  'Please Update the app to continue',
                  textAlign: TextAlign.center,
                  style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: themeColorStyle.secondaryColor.withOpacity(0.5)),
                ),
                const SizedBox(height: 30),
                PrimaryFilledButton(
                  onTap: Platform.isIOS ? _launchAppleURL : _launchAndroidURL,
                  label: 'Update',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Future<void> _launchAppleURL() async {
    //  Apple Store Link
    // 'https://apps.apple.com/pk/app/example/id1234567890';
    Uri url = Uri(
      scheme: 'https',
      host: 'apps.apple.com',
      path: '/pk/app/example/id1234567890',
    );
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  static Future<void> _launchAndroidURL() async {
    //  Google Play Store Link
    // 'https://play.google.com/store/apps/details?id=com.example.xyz';

    Uri url = Uri(
        scheme: 'https',
        host: 'play.google.com',
        path: '/store/apps/details',
        queryParameters: {'id': 'com.example.xyz'});
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
