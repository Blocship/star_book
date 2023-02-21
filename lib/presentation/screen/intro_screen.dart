import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final double deviceHeight = context.deviceHeight;
    return GradientScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: deviceHeight * 0.08),
            Image(
                image: const AssetImage('assets/images/intro_image.png'),
                height: deviceHeight * 0.2),
            SizedBox(height: deviceHeight * 0.024),
            Text(
              'So nice to meet you!',
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            Text(
              'What do your friends call you?',
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: deviceHeight * 0.028),
            const PrimaryTextField(hintText: 'Enter your name'),
            const Spacer(),
            PrimaryFilledButton(
              onTap: () =>
                  context.pushReplacementNamed(AppRouterName.mainScreen),
              label: 'Continue',
            ),
            SizedBox(height: deviceHeight * 0.03),
          ],
        ),
      ),
    );
  }
}
