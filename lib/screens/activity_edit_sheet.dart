import 'package:flutter/cupertino.dart' as c;
import 'package:flutter/widgets.dart';
// Files
import '../routes/route_generator.dart';
import '../utils/bottom_sheet.dart';
import '../widgets/action_container.dart';

class ActivityEditSheetRouteInitializer extends StatelessWidget {
  Future<bool> _handlePopScope(BuildContext context) async {
    bool shouldClose = true;
    await c.showCupertinoDialog(
        context: context,
        builder: (context) => c.CupertinoAlertDialog(
              title: Text('Should Close Activity Edit Sheet?'),
              actions: <Widget>[
                c.CupertinoButton(
                  child: Text('Yes'),
                  onPressed: () {
                    shouldClose = true;
                    Navigator.of(context).pop();
                  },
                ),
                c.CupertinoButton(
                  child: Text('No'),
                  onPressed: () {
                    shouldClose = false;
                    Navigator.of(context).pop();
                  },
                ),
              ],
            ));
    return shouldClose;
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handlePopScope(context),
      child: Navigator(
        initialRoute: '/edit',
        onGenerateRoute: (settings) => RouteGenerator.activityRoute(settings),
      ),
    );
  }
}

class ActivityEditSheet extends StatelessWidget {
  c.CupertinoNavigationBar _buildNavBar() {
    return c.CupertinoNavigationBar(
      leading: Container(),
      middle: Text("Edit"),
    );
  }

  c.SafeArea _buildBody(BuildContext context) {
    return SafeArea(
      // minimum: EdgeInsets.symmetric(horizontal: 16),
      child: c.Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(padding: EdgeInsets.symmetric(vertical: 18)),
          textContainer(
            context: context,
            child: Text("Date"),
            onTap: null,
          ),
          Padding(padding: EdgeInsets.symmetric(vertical: 8)),
          ActionContainer(
            text: "Mood",
            icon: c.CupertinoIcons.right_chevron,
            onTap: () => Navigator.of(context).pushNamed("/mood"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return c.CupertinoPageScaffold(
      backgroundColor: c.CupertinoColors.systemGroupedBackground,
      navigationBar: _buildNavBar(),
      child: _buildBody(context),
    );
  }
}
