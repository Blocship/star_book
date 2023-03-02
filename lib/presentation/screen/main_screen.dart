import 'package:flutter/material.dart';
import 'package:star_book/presentation/routes/routes.dart';
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
    // YearScreen(),
    // ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: widget.child,
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
