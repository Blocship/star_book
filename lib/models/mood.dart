// Files
import '../utils/color.dart';

class Mood {
  Mood({
    this.id,
    this.label,
    this.colorCode,
  });

  int id;
  String label;
  int colorCode;
}

List<Mood> mMoodList = new List<Mood>()
  ..add(Mood(id: 0, label: "Happy", colorCode: EColor.systemBlue.index))..add(
      Mood(id: 1, label: "Sad", colorCode: EColor.systemIndigo.index))..add(
      Mood(id: 2,
          label: "Productive",
          colorCode: EColor.systemGreen.index))..add(
      Mood(id: 3, label: "Sick", colorCode: EColor.systemYellow.index))..add(
      Mood(id: 4, label: "Normal", colorCode: EColor.systemOrange.index))..add(
      Mood(id: 5, label: "Angry", colorCode: EColor.systemRed.index));
