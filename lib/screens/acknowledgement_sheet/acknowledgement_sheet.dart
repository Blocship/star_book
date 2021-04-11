import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// Files
import '../../styles/style.dart';
import '../../widgets/my_container.dart';
import '../package_sheet.dart';

part 'license_data.dart';

class AcknowledgementSheet extends StatelessWidget {
  final Future<_LicenseData> licenses = LicenseRegistry.licenses
      .fold<_LicenseData>(
        _LicenseData(),
        (_LicenseData prev, LicenseEntry license) => prev..addLicense(license),
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

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(),
      child: SafeArea(
        child: FutureBuilder<_LicenseData>(
          future: licenses,
          builder: (context, snapshot) {
            if (!snapshot.hasData) return Container();
            final data = snapshot.data;
            return ListView(
              children: data.packages.map((package) {
                return MyContainer(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            (package.length < 35) ? package : package.substring(0, 30) + '..',
                            style: Style.body(context),
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(
                            getLicenseText(data.packageLicenseBindings[package].length),
                            style: Style.footerNoteSecondary(context),
                          ),
                        ],
                      ),
                      Icon(
                        CupertinoIcons.right_chevron,
                        color: CupertinoDynamicColor.resolve(
                          CupertinoColors.tertiaryLabel,
                          context,
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      'preference/acknowledgement/licenses',
                      arguments: PackageSheetArgument(
                        package: package,
                        licenses: data.packageLicenseBindings[package].map((index) => data.licenses[index]).toList(),
                        //
                      ),
                    );
                  },
                );
              }).toList(),
            );
          },
        ),
      ),
    );
  }
}
