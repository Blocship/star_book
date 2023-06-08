import 'package:flutter/material.dart';
import 'package:star_book/app_settings.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class SplashScreen extends StatefulWidget implements Screen<SplashScreenRoute> {
  @override
  final SplashScreenRoute arg;

  const SplashScreen({Key? key, required this.arg}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    )..forward().then((_) {
        final isFreshInstall = Injector.resolve<AppSettings>().isFreshInstall;
        if (isFreshInstall) {
          context.goToScreen(arg: const IntroScreenRoute());
        } else {
          context.goToScreen(arg: const HomeScreenRoute());
        }
      });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final double deviceHeight = context.deviceHeight;

    return GradientScaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            const Image(
              image: AssetImage('assets/icons/splash_screen_logo.png'),
              width: 115,
            ),
            SizedBox(height: deviceHeight * 0.02),
            Text('Starbook',
                style: textTheme.headlineLarge!.copyWith(
                    fontWeight: FontWeight.w700,
                    color: themeColorStyle.secondaryColor)),
            SizedBox(height: deviceHeight * 0.33),
            Text('Beta Version V2.0',
                style: textTheme.bodyMedium!
                    .copyWith(fontWeight: FontWeight.w400)),
            SizedBox(height: deviceHeight * 0.05),
          ],
        ),
      ),
    );
  }
}
