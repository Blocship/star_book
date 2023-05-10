import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/loader.dart';
import 'package:flutter/foundation.dart';
import 'dart:developer' show Timeline, Flow;
import 'package:flutter/material.dart' hide Flow;
import 'package:flutter/scheduler.dart';
import 'package:star_book/presentation/theme/styling/theme_color_style.dart';
import 'package:star_book/presentation/utils/extension.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

part 'license_data.dart';

class LicenseAgreementScreen extends StatelessWidget
    implements Screen<LicenseAgreementScreenRoute> {
  @override
  final LicenseAgreementScreenRoute arg;

  const LicenseAgreementScreen({
    super.key,
    required this.arg,
  });

  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = context.textTheme;
    final ThemeColorStyle themeColorStyle = context.themeColorStyle;
    final Future<_LicenseData> licenses = LicenseRegistry.licenses
        .fold<_LicenseData>(
          _LicenseData(),
          (_LicenseData prev, LicenseEntry license) =>
              prev..addLicense(license),
        )
        .then((_LicenseData licenseData) => licenseData..sortPackages());

    String getLicenseText(int licenseCount) {
      assert(licenseCount >= 0);
      switch (licenseCount) {
        case 0:
          return 'No licenses.';
        case 1:
          return '1 license.';
        default:
          return '$licenseCount licenses.';
      }
    }

    return Scaffold(
      appBar: PrimaryAppBar(
        centerTitle: 'License Agreement',
        leadingOnTap: () => context.shouldPop(),
      ),
      body: FutureBuilder<_LicenseData>(
        future: licenses,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Loader());
          }
          final packages = snapshot.data!.packages;
          final binding = snapshot.data!.packageLicenseBindings;
          final licenses = snapshot.data!.licenses;

          return ListView.separated(
            padding: const EdgeInsets.symmetric(
                horizontal: CustomPadding.smallPadding),
            shrinkWrap: true,
            itemCount: packages.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(
                  packages[index],
                  style: textTheme.bodyMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                      color: themeColorStyle.secondaryColor),
                ),
                subtitle: Text(
                  getLicenseText(binding[packages[index]]!.length),
                  style: textTheme.labelLarge!
                      .copyWith(fontWeight: FontWeight.w500),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LicenseScreen(
                        licenses: binding[packages[index]]!
                            .map((i) => licenses[i])
                            .toList(),
                      ),
                    ),
                  );
                },
              );
            },
            separatorBuilder: (context, index) => const Divider(),
          );
        },
      ),
    );
  }
}

class LicenseScreen extends StatefulWidget {
  final List<LicenseEntry> licenses;

  const LicenseScreen({
    Key? key,
    required this.licenses,
  }) : super(key: key);

  @override
  State<LicenseScreen> createState() => _LicenseScreenState();
}

class _LicenseScreenState extends State<LicenseScreen> {
  final List<Widget> _licenses = <Widget>[];
  bool _loaded = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _initLicenses();
  }

  Future<void> _initLicenses() async {
    int debugFlowId = -1;
    assert(() {
      final Flow flow = Flow.begin();
      Timeline.timeSync('_initLicenses()', () {}, flow: flow);
      debugFlowId = flow.id;
      return true;
    }());
    for (final LicenseEntry license in widget.licenses) {
      if (!mounted) {
        return;
      }
      assert(() {
        Timeline.timeSync('_initLicenses()', () {},
            flow: Flow.step(debugFlowId));
        return true;
      }());
      final List<LicenseParagraph> paragraphs =
          await SchedulerBinding.instance.scheduleTask<List<LicenseParagraph>>(
        license.paragraphs.toList,
        Priority.animation,
        debugLabel: 'License',
      );
      if (!mounted) {
        return;
      }
      setState(() {
        for (final LicenseParagraph paragraph in paragraphs) {
          if (paragraph.indent == LicenseParagraph.centeredIndent) {
            _licenses.add(Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                paragraph.text,
                style: context.textTheme.labelLarge,
                textAlign: TextAlign.center,
              ),
            ));
          } else {
            assert(paragraph.indent >= 0);
            _licenses.add(Padding(
              padding: EdgeInsetsDirectional.only(
                  top: 8.0, start: 16.0 * paragraph.indent),
              child: Text(
                paragraph.text,
                style: context.textTheme.labelLarge,
              ),
            ));
          }
        }
      });
    }
    setState(() {
      _loaded = true;
    });
    assert(() {
      Timeline.timeSync('Build scheduled', () {}, flow: Flow.end(debugFlowId));
      return true;
    }());
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> listWidgets = <Widget>[
      ..._licenses,
      if (!_loaded)
        const Center(
          child: CircularProgressIndicator(),
        ),
    ];

    return Scaffold(
      appBar: PrimaryAppBar(
        centerTitle: 'License',
        leadingOnTap: () => context.pop(),
      ),
      body: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: listWidgets,
        ),
      ),
    );
  }
}
