import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/screen/profile_screen.dart';
import 'package:star_book/presentation/screen/year_screen.dart';
import 'package:star_book/presentation/shared/bottom_nav_bar.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class MainScreenRoute extends RouteArg {
  static const String path = '/main';

  const MainScreenRoute() : super();

  @override
  Uri get uri => Uri(path: path);
}

class MainScreen extends StatefulWidget implements Screen<MainScreenRoute> {
  @override
  final MainScreenRoute arg;
  final Widget child;

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

  int get _currentIndex => _locationToTabIndex(context.location);

  int _locationToTabIndex(String location) {
    final index = tabs.indexWhere((t) => location.startsWith(t.path));
    // if index not found (-1), return 0
    return index < 0 ? 0 : index;
  }

  void _onItemTapped(BuildContext context, int tabIndex) {
    if (tabIndex != _currentIndex) {
      // go to the initial location of the selected tab (by index)
      context.go(tabs[tabIndex].path);
    }
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
        currentIndex: _currentIndex,
        onTap: (index) => _onItemTapped(context, index),
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
