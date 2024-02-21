import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/routes/routes.dart';
import 'package:star_book/presentation/shared/bottom_nav_bar.dart';
import 'package:star_book/presentation/widgets/gradient_scaffold.dart';

class MainScreen extends StatelessWidget implements Screen<MainScreenRoute> {
  @override
  final MainScreenRoute arg;
  final StatefulNavigationShell child;

  const MainScreen({
    super.key,
    required this.arg,
    required this.child,
  });

  void _onItemTapped(int tabIndex) {
    child.goBranch(tabIndex);
  }

  static const tabs = [
    GoRouteBottomNavBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/home_outlined.png'),
      ),
      label: 'Home',
    ),
    GoRouteBottomNavBarItem(
      icon: ImageIcon(
        AssetImage('assets/icons/account_circle.png'),
      ),
      label: 'Profile',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: child,
      bottomNavigationBar: BottomNavBar(
        currentIndex: child.currentIndex,
        onTap: _onItemTapped,
        items: tabs,
      ),
    );
  }
}

// https://codewithandrea.com/articles/flutter-bottom-navigation-bar-nested-routes-gorouter-beamer/
class GoRouteBottomNavBarItem extends BottomNavigationBarItem {
  const GoRouteBottomNavBarItem({
    required super.icon,
    super.label,
  });
}
