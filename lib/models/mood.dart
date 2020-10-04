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
  ..add(Mood(id: 0, label: "Happy", colorCode: Color.systemBlue.index))
  ..add(Mood(id: 1, label: "Sad", colorCode: Color.systemIndigo.index))
  ..add(Mood(id: 2, label: "Productive", colorCode: Color.systemGreen.index))
  ..add(Mood(id: 3, label: "Sick", colorCode: Color.systemYellow.index))
  ..add(Mood(id: 4, label: "Normal", colorCode: Color.systemOrange.index))
  ..add(Mood(id: 5, label: "Angry", colorCode: Color.systemRed.index));
