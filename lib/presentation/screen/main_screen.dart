import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/bottom_nav_bar.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class MainScreen extends StatefulWidget implements Screen<MainScreenRoute> {
  @override
  final MainScreenRoute arg;
  final StatefulNavigationShell child;

  const MainScreen({
    super.key,
    required this.arg,
    required this.child,
  });

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // late int _selectedPage;
  // late final PageController pageController;

  void _onItemTapped(int tabIndex) {
    widget.child.goBranch(tabIndex);
  }

  @override
  void initState() {
    super.initState();
    // _selectedPage = 0;
    // pageController = PageController(initialPage: _selectedPage);
  }

  // void onPageChanged(int page) {
  //   setState(() {
  //     _selectedPage = page;
  //   });
  // }

  // void onNavBarItemTapped(int page) {
  //   pageController.jumpToPage(page);
  // }

  List<Widget> pages = <Widget>[
    // YearScreen(),
    // ProfileScreen(),
  ];

  static const tabs = [
    GoRouteBottomNavBarItem(
      path: YearScreenRoute.path,
      icon: ImageIcon(
        AssetImage('assets/icons/home_outlined.png'),
      ),
      label: 'Home',
    ),
    GoRouteBottomNavBarItem(
      path: ProfileScreenRoute.path,
      icon: ImageIcon(
        AssetImage('assets/icons/account_circle.png'),
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: widget.child.currentIndex,
        onTap: _onItemTapped,
        items: tabs,
      ),
    );
  }
}

// https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/
class GoRouteBottomNavBarItem extends BottomNavigationBarItem {
  final String path;

  const GoRouteBottomNavBarItem({
    required this.path,
    required super.icon,
    super.label,
  });
}
