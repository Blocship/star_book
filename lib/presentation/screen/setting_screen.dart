import 'package:flutter/material.dart';
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
