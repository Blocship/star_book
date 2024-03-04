import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/elevated_buttons.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class PINCodeScreen extends StatelessWidget {
  const PINCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final TextTheme textTheme = context.textTheme;
    return Scaffold(
      appBar: const PrimaryAppBar(
        centerTitle: 'Setup PIN Code',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          children: [
            const SizedBox(height: 50),
            const Image(
              image: AssetImage('assets/icons/password.png'),
              width: 32,
            ),
            const SizedBox(height: 20),
            Text(
              'Choose Your 4 Digit PIN Code',
              style: textTheme.bodyLarge!.copyWith(
                fontWeight: FontWeight.w700,
                color: themeColorStyle.secondaryColor,
              ),
            ),
            const SizedBox(height: 30),
            PinCodeTextField(
              appContext: context,
              keyboardType: TextInputType.number,
              length: 5,
              enablePinAutofill: false,
              autoDismissKeyboard: true,
              pinTheme: PinTheme(
                activeColor: themeColorStyle.senaryColor,
                selectedColor: themeColorStyle.primaryColor,
                inactiveColor: themeColorStyle.octonaryColor,
              ),
              onChanged: (value) {},
            ),
            const Spacer(),
            PrimaryFilledButton(
              onTap: () {},
              label: 'Save PIN Code',
              color: themeColorStyle.senaryColor,
            ),
            const SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}
