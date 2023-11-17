import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/app_settings.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/domain/repository/user_repo.dart';
import 'package:star_book/presentation/cubits/profile_screen_cubit.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/doughnut_chart_widget.dart';
import 'package:star_book/presentation/shared/stats_widget.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class ProfileScreen extends StatelessWidget
    implements Screen<ProfileScreenRoute> {
  @override
  final ProfileScreenRoute arg;

  const ProfileScreen({super.key, required this.arg});

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceWidth = context.deviceWidth;
    final double deviceHeight = context.deviceHeight;
    return BlocProvider<ProfileScreenCubit>(
      create: (context) => ProfileScreenCubit(
        journalRepo: Injector.resolve<JournalRepo>(),
        userRepo: Injector.resolve<UserRepo>(),
      ),
      child: BlocBuilder<ProfileScreenCubit, Points>(
        builder: (context, state) {
          final getPoints =
              context.read<ProfileScreenCubit>().getStreakAndPoint();
          final userId = Injector.resolve<AppSettings>().userId;
          final getUser = context.read<ProfileScreenCubit>().getUserName(userId);
          return Scaffold(
            backgroundColor: Colors.transparent,
            appBar: SecondaryAppBar(
              leading: const Image(
                image: AssetImage('assets/icons/shooting_star.png'),
              ),
              trailing: Icons.menu_outlined,
              trailingOnTap: () =>
                  context.pushScreen(arg: const SettingsScreenRoute()),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: CustomPadding.mediumPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Back',
                      style: textTheme.headlineSmall!
                          .copyWith(fontWeight: FontWeight.w400),
                    ),
                    SizedBox(height: deviceHeight * 0.007),
                    FutureBuilder(
                      future: getUser,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? Text(
                                snapshot.data
                                    .toString()
                                    .capitalizeFirstLetter(),
                                style: textTheme.headlineMedium!.copyWith(
                                    fontWeight: FontWeight.w700, height: 1.4),
                              )
                            : const SizedBox();
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.028),
                    FutureBuilder(
                      future: getPoints,
                      builder: (context, snapshot) {
                        return snapshot.hasData
                            ? StatsWidget(
                                pointsImagePath: 'assets/icons/crown.png',
                                points: snapshot.data!.point,
                                streakImagePath: 'assets/icons/fire.png',
                                streak: snapshot.data!.streak,
                              )
                            : const StatsWidget(
                                pointsImagePath: 'assets/icons/crown.png',
                                points: 0,
                                streakImagePath: 'assets/icons/fire.png',
                                streak: 0,
                              );
                      },
                    ),
                    SizedBox(height: deviceHeight * 0.045),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Image(
                          image: AssetImage(
                              'assets/icons/analytics_donut_chart.png'),
                          height: 25,
                        ),
                        SizedBox(width: deviceWidth * 0.02),
                        Text(
                          'Analytics',
                          style: textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.w700, height: 1.4),
                        ),
                        // SizedBox(width: deviceWidth * 0.26),
                        const Spacer(),
                        GestureDetector(
                          onTap: () => context.goToScreen(
                              arg: const AnalyticsScreenRoute()),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'View Details',
                                style: textTheme.bodyMedium!.copyWith(
                                  fontWeight: FontWeight.w500,
                                  color: themeColorStyle.secondaryColor,
                                ),
                              ),
                              const Icon(Icons.keyboard_arrow_right_outlined),
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: deviceHeight * 0.028),
                    const DoughnutChartWidget(),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
