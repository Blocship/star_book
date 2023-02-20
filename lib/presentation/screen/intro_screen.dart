import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/routes/app_router_name.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return GradientScaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.08),
            Image(
                image: const AssetImage('assets/images/intro_image.png'),
                height: screenHeight * 0.2),
            SizedBox(height: screenHeight * 0.024),
            Text(
              'So nice to meet you!',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            Text(
              'What do your friends call you?',
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(fontWeight: FontWeight.w700),
            ),
            SizedBox(height: screenHeight * 0.028),
            const PrimaryTextField(hintText: 'Enter your name'),
            SizedBox(height: screenHeight * 0.41),
            PrimaryFilledButton(
              onTap: () =>
                  context.pushReplacementNamed(AppRouterName.mainScreen),
              label: 'Continue',
            ),
          ],
        ),
      ),
    );
  }
}
