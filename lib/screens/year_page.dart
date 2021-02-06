// import 'package:flutter/cupertino.dart' as c;
// import 'package:flutter/widgets.dart';

// // Files
// import '../widgets/year.dart';

// /// Year Page Widget displays calender for current year and past 4 years and dates are colored with [Mood] color.
// class YearPage extends StatefulWidget {
//   YearPage();

//   @override
//   _YearPageState createState() => _YearPageState();
// }

// class _YearPageState extends State<YearPage> {
//   int currentYear = DateTime.now().year;
//   @override
//   Widget build(BuildContext context) {
//     // TODO: for now, can only  go 5 years back
//     final int _itemCount = 5;
//     return c.CupertinoPageScaffold(
//       backgroundColor: c.CupertinoDynamicColor.resolve(
//         c.CupertinoColors.systemBackground,
//         context,
//       ),
//       navigationBar: c.CupertinoNavigationBar(
//         heroTag: 'YearPage',
//         transitionBetweenRoutes: false,
//         backgroundColor: c.CupertinoDynamicColor.resolve(
//           c.CupertinoColors.systemBackground,
//           context,
//         ),
//         border: null,
//       ),
//       child: SafeArea(
//         minimum: EdgeInsets.symmetric(horizontal: 16),
//         child: ListView.builder(
//           padding: EdgeInsets.zero,
//           scrollDirection: Axis.vertical,
//           reverse: true,
//           itemCount: _itemCount,
//           itemBuilder: (context, index) {
//             return Year(year: currentYear - index);
//           },
//         ),
//       ),
//     );
//   }
// }
