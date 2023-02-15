import 'package:flutter/material.dart';
import 'package:star_book/theme/styling/doughnut_chart_style.dart';
import 'package:star_book/theme/styling/theme_color_style.dart';
import 'package:star_book/widgets/doughnut_chart.dart';

class MonthlyAnalyticsTab extends StatelessWidget {
  const MonthlyAnalyticsTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    // final double screenWidth = MediaQuery.of(context).size.width;
    final doughnutColor = Theme.of(context).extension<DoughnutChartStyle>()!;
    return Column(
      children: [
        MoodDoughnutChart(
          moodDataMap: [
            ChartData(
                x: 'Productive', y: 3.5, color: doughnutColor.primaryColor),
            ChartData(x: 'Sad', y: 1.5, color: doughnutColor.secondaryColor),
            ChartData(x: 'Angry', y: 1.5, color: doughnutColor.tertiaryColor),
            ChartData(x: 'Happy', y: 1.5, color: doughnutColor.quinaryColor),
            ChartData(x: 'Sick', y: 2.0, color: doughnutColor.quaternaryColor),
          ],
        ),
        const SelectableTab(),
        Container(
          height: screenHeight * 0.1,
          decoration: BoxDecoration(
            color: Theme.of(context).extension<ThemeColorStyle>()!.quinaryColor,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: doughnutColor.primaryColor,
                    radius: 7,
                  ),
                  Text('Productive'),
                  CircleAvatar(
                    backgroundColor: doughnutColor.secondaryColor,
                    radius: 7,
                  ),
                  Text('Angry'),
                  CircleAvatar(
                    backgroundColor: doughnutColor.tertiaryColor,
                    radius: 7,
                  ),
                  Text('Sick'),
                ],
              ),
              Row(
                children: [
                  CircleAvatar(
                    backgroundColor: doughnutColor.quinaryColor,
                    radius: 7,
                  ),
                  Text('Sad'),
                  CircleAvatar(
                    backgroundColor: doughnutColor.quaternaryColor,
                    radius: 7,
                  ),
                  Text('Happy'),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class SelectableTab extends StatefulWidget {
  const SelectableTab({super.key});

  @override
  State<SelectableTab> createState() => _SelectableTabState();
}

class _SelectableTabState extends State<SelectableTab> {
  String selectedMonths = 'Jan';

  final List<String> months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul'];

  Widget _buildTab(String month, bool isSelected) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMonths = month;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(5),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Text(
          month,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children:
          months.map((day) => _buildTab(day, day == selectedMonths)).toList(),
    );
  }
}
