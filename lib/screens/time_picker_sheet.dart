// import 'package:flutter/cupertino.dart' as c;
// import 'package:flutter/widgets.dart';

// // Files
// import '../styles/style.dart';
// import '../widgets/my_container.dart';

// /// Time Picker Screen displays option to switch select time for reminder.
// class TimePickerSheet extends StatefulWidget {
//   final RouteSettings settings;

//   TimePickerSheet(this.settings);

//   @override
//   _TimePickerSheetState createState() => _TimePickerSheetState();
// }

// class _TimePickerSheetState extends State<TimePickerSheet> {
//   c.TextEditingController timeController = new c.TextEditingController();
//   DateTime _time;

//   @override
//   void initState() {
//     super.initState();
//     timeController.text;
//   }

//   @override
//   void dispose() {
//     timeController.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return c.WillPopScope(
//       onWillPop: () async {
//         return true;
//       },
//       child: c.CupertinoPageScaffold(
//         backgroundColor: c.CupertinoDynamicColor.resolve(
//           c.CupertinoColors.systemGrey6,
//           context,
//         ),
//         navigationBar: c.CupertinoNavigationBar(
//           backgroundColor: c.CupertinoDynamicColor.resolve(
//               c.CupertinoColors.systemGrey6, context),
//           middle: Text("Time"),
//           border: null,
//         ),
//         child: SingleChildScrollView(
//           child: SafeArea(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 SizedBox(
//                   height: 20,
//                 ),
//                 MyContainer(
//                   child: c.CupertinoTextField(
//                     textAlign: TextAlign.center,
//                     style: Style.body(context),
//                     readOnly: true,
//                     placeholder: 'time',
//                     decoration: null,
//                     controller: timeController,
//                     maxLines: 1,
//                     onTap: null,
//                   ),
//                 ),
//                 SizedBox(
//                   height: 30,
//                 ),
//                 Center(
//                   child: Text(
//                     "Choose Time",
//                     style: Style.body(context),
//                   ),
//                 ),
//                 Container(
//                   padding: EdgeInsets.all(10),
//                   height: MediaQuery.of(context).size.height * 2 / 5,
//                   child: c.CupertinoDatePicker(
//                     onDateTimeChanged: (DateTime time) {
//                       setState(() {
//                         _time = time;
//                         timeController.text = '${_time.hour}:${_time.minute}';
//                       });
//                     },
//                     use24hFormat: true,
//                     mode: c.CupertinoDatePickerMode.time,
//                   ),
//                 )
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
