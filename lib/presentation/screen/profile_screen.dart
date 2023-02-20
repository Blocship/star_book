import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/doughnut_chart_widget.dart';
import 'package:star_book/presentation/shared/stats_widget.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return GradientScaffold(
      appBar: SecondaryAppBar(
        leadingIcon: SecondaryAppBarItem(
            icon: const Image(
                image: AssetImage('assets/icons/shooting_star.png'))),
        trailingIcon: SecondaryAppBarItem(
          icon: const Icon(Icons.menu_outlined),
          onTap: () => context.goNamed(AppRouterName.settingScreen),
        ),
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.mediumPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Welcome Back',
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 6),
            Text(
              'Noor Ul Abedin 👋',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: Theme.of(context)
                        .extension<ThemeColorStyle>()!
                        .secondaryColor,
                  ),
            ),
            const SizedBox(height: 22),
            const StatsWidget(
              pointsImagePath: 'assets/icons/crown.png',
              points: '30',
              streakImagePath: 'assets/icons/fire.png',
              streak: '06',
            ),
            const SizedBox(height: 35),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Image(
                  image: AssetImage('assets/icons/analytics_donut_chart.png'),
                  height: 25,
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  'Analytics',
                  style: Theme.of(context)
                      .textTheme
                      .headlineMedium!
                      .copyWith(fontWeight: FontWeight.w700, height: 1.4),
                ),
                SizedBox(width: screenWidth * 0.26),
                GestureDetector(
                  onTap: () => context.goNamed(AppRouterName.analyticScreen),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'View Details',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                              fontWeight: FontWeight.w500,
                              color: Theme.of(context)
                                  .extension<ThemeColorStyle>()!
                                  .secondaryColor,
                            ),
                      ),
                      const Icon(Icons.keyboard_arrow_right_outlined),
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 22),
            const DoughnutChartWidget(),
          ],
        ),
      ),
    );
  }
}
