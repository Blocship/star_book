import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

// Files
import '../styles/style.dart';

class PackageSheetArgument {
  final String package;
  final List<LicenseEntry> licenses;
  PackageSheetArgument({
    required this.package,
    required this.licenses,
  });
}

class PackageSheet extends StatefulWidget {
  static const String Licenses = '/preference/acknowledgement/licenses';
  final PackageSheetArgument args;

  const PackageSheet(this.args);
  @override
  _PackageSheetState createState() => _PackageSheetState();
}

class _PackageSheetState extends State<PackageSheet> {
  final List<Widget> _licenses = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    _initLicenses();
    super.didChangeDependencies();
  }

  Future<void> _initLicenses() async {
    for (final LicenseEntry license in widget.args.licenses) {
      final List<LicenseParagraph> paragraphs = license.paragraphs.toList();

      setState(() {
        _licenses.add(const Padding(
          padding: EdgeInsets.symmetric(vertical: 18.0),
          child: Text(
            '🍀‬', // That's U+1F340. Could also use U+2766 (❦) if U+1F340 doesn't work everywhere.
            textAlign: TextAlign.center,
          ),
        ));
        for (final LicenseParagraph paragraph in paragraphs) {
          if (paragraph.indent == LicenseParagraph.centeredIndent) {
            _licenses.add(Padding(
              padding: const EdgeInsets.only(top: 16.0),
              child: Text(
                paragraph.text,
                style: Style.footerNotePrimary(context).copyWith(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ));
          } else {
            _licenses.add(Padding(
              padding: EdgeInsetsDirectional.only(top: 8.0, start: 16.0 * paragraph.indent),
              child: Text(
                paragraph.text,
                style: Style.footerNotePrimary(context),
              ),
            ));
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      backgroundColor: CupertinoDynamicColor.resolve(
        CupertinoColors.systemGrey6,
        context,
      ),
      navigationBar: const CupertinoNavigationBar(),
      child: SafeArea(
        minimum: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Column(
            children: _licenses,
          ),
        ),
      ),
    );
  }
}
