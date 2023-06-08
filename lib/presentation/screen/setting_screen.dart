import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:star_book/app_settings.dart';
import 'package:star_book/data/utils/local_database.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/service/links.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/tile.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class SettingsScreen extends StatelessWidget
    implements Screen<SettingsScreenRoute> {
  @override
  final SettingsScreenRoute arg;

  const SettingsScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    return GradientScaffold(
      appBar: PrimaryAppBar(
        leadingOnTap: () => context.shouldPop(),
        centerTitle: 'Settings',
      ),
      body: Padding(
        padding:
            const EdgeInsets.symmetric(horizontal: CustomPadding.smallPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            CustomTile(
                title: 'Starbook Community',
                subtitle: 'Know who’s using starbook app',
                onTap: () => UrlLauncher().starBookCommunity()),
            CustomTile(
                title: 'About Developer',
                subtitle: 'Person info who developed this amazing app',
                onTap: () => UrlLauncher().developer()),
            CustomTile(
                title: 'Privacy & Terms',
                subtitle: 'All your data and personal info terms',
                onTap: () => UrlLauncher().privacyPolicy()),
            CustomTile(
              title: 'License Agreement',
              subtitle: 'Your licensed agreement with starbook',
              onTap: () =>
                  context.goToScreen(arg: const LicenseAgreementScreenRoute()),
            ),
            if (kDebugMode) ...[
              const SizedBox(height: 30),
              Text('Debug Mode', style: textTheme.bodyMedium),
              CustomTile(
                title: 'Clear App Settings',
                subtitle: 'Clears all app settings',
                onTap: () async {
                  await Injector.resolve<AppSettings>().clear();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('App settings cleared'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              ),
              CustomTile(
                title: 'Clear Local Database',
                subtitle: 'Clears all local database',
                onTap: () async {
                  final isCleared = await LocalDatabase.clear();
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isCleared
                            ? 'Local database cleared successfully'
                            : 'Local database not cleared',
                      ),
                      duration: const Duration(seconds: 2),
                    ),
                  );
                },
              ),
              CustomTile(
                title: 'Log Routes',
                subtitle: 'Log Route tree',
                onTap: () async {
                  // ignore: invalid_use_of_visible_for_testing_member
                  AppRouter.printPaths();
                },
              ),
            ],
            const Spacer(),
            Text(
              'App version 2.0',
              style:
                  textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 10),
            const BlocShipTile(),
            const SizedBox(height: 10),
            const UxerShipTile(),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
