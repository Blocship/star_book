import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/utils/extension.dart';

class LicenseAgreementScreen extends StatelessWidget {
  const LicenseAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Starbook License Agreement',
                style: textTheme.bodyLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: themeColorStyle.secondaryColor),
              ),
            ),
            SizedBox(height: deviceHeight * 0.04),
            SizedBox(
                height: deviceHeight * 0.75,
                child: SingleChildScrollView(
                  child: Text(
                    '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim dui purus sit hac ac, ornare a nibh etiam. Diam eget mauris, iaculis pellentesque hendrerit turpis dolor facilisi velit. Ullamcorper sit adipiscing sed id nisl at integer. Tristique in lectus interdum nisi augue pellentesque laoreet ullamcorper sagittis. Lectus leo ut diam laoreet sit. Sed non netus cum faucibus blandit. Non non ut donec quisque ut suscipit mauris. Est, id egestas euismod diam, sagittis condimentum vitae vestibulum.

Facilisi lectus feugiat pharetra diam scelerisque suspendisse mauris consequat aliquam. Id ornare viverra ornare posuere gravida facilisi blandit. Ut vestibulum habitant tortor vel lacus ac aliquet. Condimentum condimentum ut massa lacus condimentum varius. Laoreet rutrum tincidunt enim, amet, et. Cursus adipiscing sed sapien ac sollicitudin varius.

Ullamcorper sit adipiscing sed id nisl at integer. Tristique in lectus interdum nisi augue pellentesque laoreet ullamcorper sagittisLorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim dui purus sit hac ac, ornare a nibh etiam. Diam eget mauris, iaculis pellentesque hendrerit turpis dolor facilisi velit. Ullamcorper sit adipiscing sed id nisl at integer. Tristique in lectus interdum nisi augue pellentesque laoreet ullamcorper sagittis. Lectus leo ut diam laoreet sit. Sed non netus cum faucibus blandit. Non non ut donec quisque ut suscipit mauris. Est, id egestas euismod diam, sagittis condimentum vitae vestibulum.

Facilisi lectus feugiat pharetra diam scelerisque suspendisse mauris consequat aliquam. Id ornare viverra ornare posuere gravida facilisi blandit. Ut vestibulum habitant tortor vel lacus ac aliquet. Condimentum condimentum ut massa lacus condimentum varius. Laoreet rutrum tincidunt enim, amet, et. Cursus adipiscing sed sapien ac sollicitudin varius.

Ullamcorper sit adipiscing sed id nisl at integer. Tristique in lectus interdum nisi augue pellentesque laoreet ullamcorper sagittis. Lectus leo ut diam laoreet sit. Sed non netus cum faucibus blandit. Non non ut donec quisque ut suscipit mauris. Est, id egestas euismod diam, sagittis condimentum vitae vestibulum.''',
                    style: textTheme.bodyMedium!
                        .copyWith(fontWeight: FontWeight.w400, height: 1.5),
                  ),
                )),
            SizedBox(height: deviceHeight * 0.02),
            PrimaryFilledButton(
              label: 'Done',
              onTap: () => context.goNamed(AppRouterName.settingScreen),
            ),
            SizedBox(height: deviceHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
