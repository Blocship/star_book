import 'package:flutter/material.dart';
import 'package:star_book/floating_action_button.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class MoodPickerScreen extends StatefulWidget {
  const MoodPickerScreen({Key? key}) : super(key: key);

  @override
  State<MoodPickerScreen> createState() => _MoodPickerScreenState();
}

class _MoodPickerScreenState extends State<MoodPickerScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Mood',
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          const SizedBox(height: CustomPadding.mediumPadding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: MoodTilePair.moods.length,
            itemBuilder: (context, index) {
              MapEntry<String, Color> getPair = MoodTilePair().getPair(index);
              return MoodTile(
                  title: getPair.key,
                  color: getPair.value,
                  isSelected: selectedIndex == index,
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                  });
            },
          ),
        ],
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () {},
        child: const Icon(Icons.done),
      ),
    );
  }
}

class MoodTilePair {
  static const Map<String, Color> moods = {
    'Happy': Colors.blue,
    'Sad': Colors.purple,
    'Productive': Colors.green,
    'Sick': Colors.orange,
    'Normal': Colors.pink,
  };
  MapEntry<String, Color> getPair(int index) {
    final keys = moods.keys.toList();
    final key = keys[index];
    return MapEntry(key, moods[key]!);
  }
}

class MoodTile extends StatelessWidget {
  final String title;
  final Color color;
  final bool isSelected;
  final VoidCallback onTap;
  const MoodTile({
    Key? key,
    required this.title,
    required this.color,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: CustomPadding.smallPadding,
        horizontal: CustomPadding.mediumPadding,
      ),
      child: ListTile(
        dense: true,
        shape: RoundedRectangleBorder(
            side: BorderSide(
                color: isSelected ? color : Colors.transparent, width: 2.0),
            borderRadius: BorderRadius.circular(8)),
        tileColor: color.withOpacity(0.1),
        selectedTileColor: color.withOpacity(0.1),
        onTap: onTap,
        leading: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: isSelected ? color : color.withOpacity(0.4)),
        ),
        trailing: CircleAvatar(
          radius: 6,
          backgroundColor: isSelected ? color : color.withOpacity(0.4),
        ),
        selected: isSelected,
      ),
    );
  }
}
