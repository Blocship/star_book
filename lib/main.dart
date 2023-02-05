import 'package:flutter/material.dart';
import 'package:star_book/presentation/injector/injector.dart';
import 'package:star_book/presentation/screen/calendar/custom_calendar.dart';
import 'package:star_book/presentation/shared/text_field.dart';
import 'package:star_book/theme/ultramarine_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.initialise();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: UltramarineLightTheme().theme,
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            SizedBox(
              height: 80,
              child: CustomTextFormField(
                heading: 'Title',
                label: 'Enter  YOur Mood',
              ),
            ),
            SizedBox(
              // height: 80,
              child: CustomTextFormField(
                heading: 'Title',
                label: 'Enter  YOur Mood',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
