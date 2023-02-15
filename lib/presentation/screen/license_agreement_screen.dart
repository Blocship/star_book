import 'package:flutter/material.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';

class LicenseAgreementScreen extends StatelessWidget {
  const LicenseAgreementScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Starbook License Agreement',
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .secondaryColor),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                '''Lorem ipsum dolor sit amet, consectetur adipiscing elit. Dignissim dui purus sit hac ac, ornare a nibh etiam. Diam eget mauris, iaculis pellentesque hendrerit turpis dolor facilisi velit. Ullamcorper sit adipiscing sed id nisl at integer. Tristique in lectus interdum nisi augue pellentesque laoreet ullamcorper sagittis. Lectus leo ut diam laoreet sit. Sed non netus cum faucibus blandit. Non non ut donec quisque ut suscipit mauris. Est, id egestas euismod diam, sagittis condimentum vitae vestibulum.

Facilisi lectus feugiat pharetra diam scelerisque suspendisse mauris consequat aliquam. Id ornare viverra ornare posuere gravida facilisi blandit. Ut vestibulum habitant tortor vel lacus ac aliquet. Condimentum condimentum ut massa lacus condimentum varius. Laoreet rutrum tincidunt enim, amet, et. Cursus adipiscing sed sapien ac sollicitudin varius.

Ullamcorper sit adipiscing sed id nisl at integer. Tristique in lectus interdum nisi augue pellentesque laoreet ullamcorper sagittis. Lectus leo ut diam laoreet sit. Sed non netus cum faucibus blandit. Non non ut donec quisque ut suscipit mauris. Est, id egestas euismod diam, sagittis condimentum vitae vestibulum.''',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400, height: 1.5),
              ),
              SizedBox(height: screenHeight * 0.16),
              PrimaryFilledButton(
                label: 'Done',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
