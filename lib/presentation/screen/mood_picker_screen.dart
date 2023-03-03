import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:star_book/domain/models/mood/mood.dart';
import 'package:star_book/presentation/widgets/floating_action_button.dart';
import 'package:star_book/presentation/shared/app_bar.dart';
import 'package:star_book/presentation/shared/mood_tile.dart';
import 'package:star_book/presentation/utils/padding_style.dart';

class MoodPickerScreen extends StatefulWidget {
  const MoodPickerScreen({Key? key}) : super(key: key);

  @override
  State<MoodPickerScreen> createState() => _MoodPickerScreenState();
}

class _MoodPickerScreenState extends State<MoodPickerScreen> {
  int selectedIndex = 0;
  Mood selectedMood = const Mood(
    id: '0',
    label: '',
    color: 0xFFFFFFFF,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PrimaryAppBar(
        isBottomSheet: true,
        leadingOnTap: () => context.pop(),
        centerTitle: 'Select Mood',
      ),
      body: Column(
        children: [
          const SizedBox(height: CustomPadding.mediumPadding),
          ListView.builder(
            shrinkWrap: true,
            itemCount: MoodTilePair.moods.length,
            itemBuilder: (context, index) {
              Mood getPair = MoodTilePair.moods[index];
              return Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: CustomPadding.smallPadding,
                  horizontal: CustomPadding.mediumPadding,
                ),
                child: MoodTile(
                    title: getPair.label,
                    color: Color(getPair.color),
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
        onTap: () {
          final selected = Mood(
            id: 'id',
            label: MoodTilePair.moods[selectedIndex].label,
            color: MoodTilePair.moods[selectedIndex].color,
          );
          setState(() {
            selectedMood = selected;
          });
          context.pop(selectedMood);
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}

class MoodTilePair {
  static const List<Mood> moods = [
    Mood(id: '1', label: 'Happy', color: 0xFF0179FF),
    Mood(id: '2', label: 'Sad', color: 0xFF565AC9),
    Mood(id: '3', label: 'Productive', color: 0xFF32C74F),
    Mood(id: '4', label: 'Sick', color: 0xFFFF9600),
    Mood(id: '5', label: 'Normal', color: 0xFFFF3932),
  ];
}
