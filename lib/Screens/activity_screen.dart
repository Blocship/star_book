import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:star_book/Screens/story_screen.dart';
import 'package:star_book/models/category.dart';

class ActivityScreen extends StatefulWidget {
  static String id = 'ActivityScreen';
  final mood;

  ActivityScreen(this.mood);

  @override
  _ActivityScreenState createState() => _ActivityScreenState(mood);
}

class _ActivityScreenState extends State<ActivityScreen> {
  String mood;
  List<Category> categories = [
    Category(icon: Icons.add, label: "Add"),
    Category(icon: Icons.mood, label: "House"),
    Category(icon: Icons.filter, label: "Work"),
    Category(icon: Icons.search, label: "Relationship"),
    Category(icon: Icons.airplanemode_active, label: "Neighbour"),
    Category(icon: Icons.school, label: "Education"),
    Category(icon: FontAwesomeIcons.temperatureHigh, label: "Weather"),
    Category(icon: Icons.fastfood, label: "Food"),
    Category(icon: Icons.location_on, label: "Location"),
  ];
  String selectedItem;

  _ActivityScreenState(this.mood);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
                flex: 3,
                child: Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.only(top: 42, right: 32),
                      child: Hero(
                        tag: 'UserIcon',
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/user.png'),
                        ),
                      ),
                    ),
                  ],
                )),
            Expanded(
              flex: 1,
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  "What made you feel $mood?",
                  style: TextStyle(fontSize: 23),
                ),
              ),
            ),
            Expanded(
              flex: 9,
              child: Container(
                height: MediaQuery.of(context).size.height / 1.94,
                child: GridView.builder(
                  padding: EdgeInsets.all(0),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                  ),
                  itemBuilder: (context, int) {
                    return Container(
                      margin: EdgeInsets.all(16),
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedItem = categories[int].label;
                          });
                        },
                        child: Card(
                          color: selectedItem == categories[int].label
                              ? Colors.grey[300]
                              : Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100)),
                          elevation: 0,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(categories[int].icon),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                categories[int].label,
                                style: TextStyle(fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                  itemCount: categories.length,
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back_ios),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      color: Colors.blueAccent,
                    ),
                    IconButton(
                      icon: Icon(Icons.arrow_forward_ios),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => StoryScreen(),
                          ),
                        );
                      },
                      color: Colors.blueAccent,
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
