import 'dart:io';

import 'package:flutter/material.dart';
import 'package:star_book/dashboardPage.dart';
import 'package:star_book/homePage.dart';
import 'package:star_book/modePickerScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
  int selectedPage = 0;

  final List<Widget> _pages = [
    HomePage(),
    DashboardPage(),
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
      selectedPage = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isIOS) {
      return Scaffold(
        body: _pages[selectedPage],
        drawer: Drawer(),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: selectedPage,
            onTap: (int value) => onNavBarTap(value),
            items: _navbarOptionList,
            elevation: 0,
          ),
        ),
      );
    } else {
      return SafeArea(
        child: Scaffold(
          body: _pages[selectedPage],
          drawer: Drawer(),
          bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.transparent),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              currentIndex: selectedPage,
              onTap: (int value) => onNavBarTap(value),
              items: _navbarOptionList,
              elevation: 0,
            ),
          ),
        ),
      );
    }
  }
}
