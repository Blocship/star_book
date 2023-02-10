import 'package:flutter/material.dart';
import 'package:star_book/widgets/gradient_scaffold.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

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
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChanged,
        children: pages,
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Theme(
            data: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent),
            child: BottomNavigationBar(
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
              elevation: 0,
              currentIndex: _selectedPage,
              onTap: onNavBarItemTapped,
              iconSize: 25,
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
          ),
        ),
      ),
    );
  }
}
