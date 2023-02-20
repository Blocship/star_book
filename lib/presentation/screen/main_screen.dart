import 'package:flutter/material.dart';
import 'package:star_book/presentation/screen/home_screen.dart';
import 'package:star_book/presentation/screen/profile_screen.dart';
import 'package:star_book/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  late int _selectedPage;
  late final PageController pageController;

  @override
  void initState() {
    super.initState();
    _selectedPage = 0;
    pageController = PageController(initialPage: _selectedPage);
  }

  void onPageChanged(int page) {
    setState(() {
      _selectedPage = page;
    });
  }

  void onNavBarItemTapped(int page) {
    pageController.jumpToPage(page);
  }

  List<Widget> pages = <Widget>[
    const HomeScreen(),
    const ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedPage,
        onTap: onNavBarItemTapped,
        items: const [
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/home_outlined.png'),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: ImageIcon(
              AssetImage('assets/icons/account_circle.png'),
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
