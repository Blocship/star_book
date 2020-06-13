import 'package:flutter/material.dart';
import 'package:star_book/homePage.dart';
import './widgets/modePickerScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'StarBook',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedPage = 0;
  final List<Widget> _pages = [
    HomePage(),
    Text("2"),
    Text("3"),
    ModePicker()
  ];
  final List<BottomNavigationBarItem> _navbarOptionList = [
    BottomNavigationBarItem(
      icon: Icon(Icons.home, size: 20),
      title: Text("Home"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.dashboard, size: 20),
      title: Text("Dashboard"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person_outline, size: 20),
      title: Text("Profile"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_bubble_outline, size: 20),
      title: Text("random"),
    ),
  ];

  void onNavBarTap(int index) {
    setState(() {
      _selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('StarBook'),
      ),
      body: _pages[_selectedPage],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _selectedPage,
        onTap: (int value) => onNavBarTap(value),
        items: _navbarOptionList,
      ),
    );
  }
}
