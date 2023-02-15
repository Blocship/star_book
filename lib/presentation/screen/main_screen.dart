import 'package:flutter/material.dart';
import 'package:star_book/presentation/shared/custom_bottom_nav_bar.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

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

  List<Widget> pages = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return GradientScaffold(
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: onPageChanged,
            children: pages,
          ),
          CustomBottomNavBar(
            backgroundColor: Colors.white,
            selectedItemColor: const Color(0xFF7B7CFF),
            unselectedItemColor: const Color(0xFF7B7CFF).withOpacity(0.4),
            selectedLabelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xFF7B7CFF)),
            unselectedLabelStyle: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF7B7CFF).withOpacity(0.4)),
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
        ],
      ),
    );
  }
}
