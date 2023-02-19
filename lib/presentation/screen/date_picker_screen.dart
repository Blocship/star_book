import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/routes/app_router_name.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';
import 'package:star_book/widgets/date_picker.dart';

class DatePickerScreen extends StatelessWidget {
  const DatePickerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_outlined,
          label: 'Back',
          onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
        ),
        center: 'Select Date',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: screenHeight * 0.04),
            Container(
              height: screenHeight * 0.06,
              decoration: BoxDecoration(
                color: Theme.of(context)
                    .extension<ThemeColorStyle>()!
                    .septenaryColor,
                borderRadius: BorderRadius.circular(8.0),
              ),
              alignment: Alignment.center,
              child: Text(
                'MM--DD--YY',
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context)
                          .extension<ThemeColorStyle>()!
                          .secondaryColor,
                    ),
              ),
            ),
            SizedBox(height: screenHeight * 0.04),
            const DatePicker(),
          ],
        ),
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
        child: const Icon(Icons.check),
      ),
    );
  }
}
