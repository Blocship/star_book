import 'package:flutter/material.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: GradientScaffold(
        body: TestingWidget(),
      ),
    );
  }
}

/// Just for Testing

class TestingWidget extends StatelessWidget {
  const TestingWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Welcome to Star Book')
      ),
    );
  }
}
