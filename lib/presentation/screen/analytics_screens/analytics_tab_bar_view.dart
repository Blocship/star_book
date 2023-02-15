import 'package:flutter/material.dart';
import 'package:star_book/presentation/screen/analytics_screens/monthly_analytics.dart';
import 'package:star_book/presentation/screen/analytics_screens/weekly_analytics.dart';
import 'package:star_book/presentation/shared/app_bar.dart';

class AnalyticsTabBarView extends StatelessWidget {
  const AnalyticsTabBarView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    final double screenWidth = MediaQuery.of(context).size.width;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PrimaryAppBar(
          leading: PrimaryAppBarItem(
            icon: Icons.arrow_back_ios_outlined,
            label: 'Back',
          ),
          center: 'Analytics',
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          // alignment: Alignment.center,
          children: [
            // SizedBox(height: screenHeight * 0.5),
            // Positioned(
            //   top: 100,
            //   child:
            Container(
              width: screenWidth * 0.5,
              height: screenHeight * 0.05,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(15),
              ),
              child: TabBar(
                indicatorColor: Colors.transparent,
                overlayColor: MaterialStateProperty.all(Colors.blue),
                unselectedLabelColor: Colors.blueGrey,
                tabs: const [
                  Tab(text: 'Weekly'),
                  Tab(text: 'Monthly'),
                ],
              ),
              // ),
            ),
            const TabBarView(
              children: [
                WeeklyAnalyticsTab(),
                MonthlyAnalyticsTab(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
