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
  ..add(Mood(id: 0, label: "Happy", colorCode: 0xff00b9ff))
  ..add(Mood(id: 1, label: "Sad", colorCode: 0xffe000ff))
  ..add(Mood(id: 2, label: "Productive", colorCode: 0xff00ffa2))
  ..add(Mood(id: 3, label: "Sick", colorCode: 0xfffeff00))
  ..add(Mood(id: 4, label: "Normal", colorCode: 0xffffc600))
  ..add(Mood(id: 5, label: "Angry", colorCode: 0xffff6100));
