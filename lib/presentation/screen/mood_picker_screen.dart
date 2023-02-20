import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/mood_tile.dart';
import 'package:star_book/presentation/utils/padding_style.dart';
import 'package:star_book/presentation/routes/app_router_name.dart';

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
      appBar: PrimaryAppBar(
        leading: PrimaryAppBarItem(
          icon: Icons.arrow_back_ios_new_outlined,
          label: 'Back',
          onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
        ),
        center: 'Select Mood',
      ),
      body: Column(
        children: [
          const SizedBox(height: CustomPadding.mediumPadding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: MoodTilePair.moods.length,
            itemBuilder: (context, index) {
              MapEntry<String, Color> getPair = MoodTilePair().getPair(index);
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: CustomPadding.smallPadding,
                  horizontal: CustomPadding.mediumPadding,
                ),
                child: MoodTile(
                    title: getPair.key,
                    color: getPair.value,
                    isSelected: selectedIndex == index,
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    }),
              );
            },
          ),
        ],
      ),
      floatingActionButton: SecondaryFloatingActionButton(
        onTap: () => context.goNamed(AppRouterName.journalCreateScreen),
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
