// import 'dart:io';

// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';

// /// Function to show a toast describing the internal error
// void displayErrorDescription(String errorMsg, FToast errToast) {
//   if (errorMsg == null) return;
//   Widget toast = Container(
//     padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
//     decoration: BoxDecoration(
//       borderRadius: BorderRadius.circular(5.0),
//       color: CupertinoColors.systemRed,
//     ),
//     child: Text(
//       errorMsg,
//       style: TextStyle(color: Colors.white),
//     ),
//   );

//   errToast.showToast(
//     child: toast,
//     gravity: ToastGravity.BOTTOM,
//     toastDuration: Duration(seconds: 2),
//   );
// }

// // Function to handle error and exceptions and displaying them to users
// void handleErrors(_error, FToast errToast) {
//   if (_error.runtimeType == OSError || _error.runtimeType == SocketException) {
//     print("OSError/Socket Exception: + ${_error.message}}\n"
//         "No Network Connection, Try Again later!!");
//     //Show Error Message
//     displayErrorDescription("No Network Connection!!", errToast);
//   } else {
//     print('Unkown Error Occured: ${_error.toString()}');
//     //Show Error Message
//     displayErrorDescription(
//         "Unknown error occurred, restart the app!!", errToast);
//   }
// }
