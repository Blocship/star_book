import 'package:hive/hive.dart';

// Files
import '../utils/constant.dart';
import '../utils/string.dart';

part '../models_hive_generated/activity.g.dart';

/// If you think as relational database then it is the name of [Activity] table.
///
/// constant value `activity`
const String activityBoxName = 'activity';

/// Data Type Activity
///
/// If you think as relational database,
/// table name is [activityBoxName] and fields
/// [id], [day], [month], [year], [moodId], [title] and [note]
/// are table column names
/// and adding [Activtiy] object is like adding new row in database.
@HiveType(typeId: activityTypeId)
class Activity extends HiveObject {
  Activity({
    this.id,
    this.day,
    this.month,
    this.year,
    this.moodId,
    this.title,
    this.note,
  });

  /// Deep copy constructor
  Activity.from(Activity activity) {
    this.id = activity.id;
    this.day = activity.day;
    this.month = activity.month;
    this.year = activity.year;
    this.moodId = activity.moodId;
    this.title = activity.title;
    this.note = activity.note;
  }

  @HiveField(0)
  int id;
  @HiveField(1)
  int day;
  @HiveField(2)
  int month;
  @HiveField(3)
  int year;
  @HiveField(4)
  int moodId;
  @HiveField(5)
  String title;
  @HiveField(6)
  String note;

  /// Checks if any of the fields is null or not.
  /// Except [key] and [id]
  bool isFilled() {
    return (this.day != null &&
        this.month != null &&
        this.year != null &&
        this.moodId != null &&
        !isNullOrEmpty(this.title) &&
        !isNullOrEmpty(this.note));
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Activity &&
        this.id == o.id &&
        this.day == o.day &&
        this.month == o.month &&
        this.year == o.year &&
        this.moodId == o.moodId &&
        this.title == o.title &&
        this.note == o.note;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        day.hashCode ^
        month.hashCode ^
        year.hashCode ^
        moodId.hashCode ^
        title.hashCode ^
        note.hashCode;
  }

  @override
  String toString() {
    return '{\n id: ${this.id},\n day: ${this.day},\n month: ${this.month},\n year: ${this.year},\n moodId: ${this.moodId},\n title: ${this.title},\n note: ${this.note}, \n}';
  }

  Activity copyWith(
      {int id,
      int day,
      int month,
      int year,
      int moodId,
      String title,
      String note}) {
    return Activity(
        id: id ?? this.id,
        day: day ?? this.day,
        month: month ?? this.month,
        year: year ?? this.year,
        moodId: moodId ?? this.moodId,
        title: title ?? this.title,
        note: note ?? this.note);
  }
}

/// Mock list of Activities
List<Activity> mActivityList = new List<Activity>()
  // Happy Day
  ..add(Activity(
      day: 01,
      month: 01,
      year: 2021,
      moodId: 0,
      title: "Happy New Year",
      note: """
        Voila Diary,
        Today, I had a great time as this was the 1st day of the year. Once again, I took resolutions for the year which I am going to follow(:P) or at least try to follow(:O). Today, I started my day with some exercise and healthy breakfast. Then, spent the rest of my day with my family and which I really enjoyed. At the end of the day, we had a special dinner made by my mother. Today was the perfect beginning of the year. Hurray!! Goodbye Diary...
        """))
  // Productive Day
  ..add(Activity(
    day: 02,
    month: 01,
    year: 2021,
    moodId: 2,
    title: "Building Habits",
    note: """
        Dear Diary, 
        Following the daily routine, I started my day with some exercise and healthy breakfast. After that, I devoted some quality time to my ongoing project and studied & explored new topics of Flutter. Overall, I had a productive day and took the most out of it :)
        """,
  ))
  // Sad Day
  ..add(Activity(
    day: 21,
    month: 07,
    year: 2019,
    moodId: 1,
    title: "Day not well spent",
    note: """
        Dear Diary,
        I did nothing much today. I woke up at 7 in the morning as usual. It was raining heavily, so I didn't go to college. I know it was just an excuse and I regret it. During the day time, I did nothing other than watching YouTube videos. At 5 in the evening, I went to the market to grab something to eat, and all of a sudden, I saw my professor sitting opposite me. I was really embarrassed as I already informed him that I wasn't feeling good and won't be able to come to class today. Sorry again, but see how Karma works. I will make sure to avoid such excuses from today. God, help me and forgive me. Lessons learned: Don't lie or make excuses.
        """,
  ))
  // Normal Day
  ..add(Activity(
    day: 5,
    month: 11,
    year: 2020,
    moodId: 4,
    title: "Assignments",
    note: """
        Hey Diary, 
        Today is the last date for report submission of all my theory subjects on which I have been working lately for the last 1 month. During the course time, I consulted my college friends & professors regarding this, we attended our last meeting today discussing the closing points which needs to be present in the report. Ahhh, that was a long discussion. I spent the whole day giving some final touches to the reports and submitted all of them just 15 mins ago. I got really tired by all this stuff and I am in need of some real sleep. Goodbye diary. See you tom...
        """,
  ))
  // Productive Day
  ..add(Activity(
    day: 06,
    month: 01,
    year: 2020,
    moodId: 2,
    title: "Starting ML",
    note: """
        Dear Diary, 
        Everything is going fine. I'm spending my college break productively. Learning new stuff daily. Today, I started with ML and you know what, I'm so much in love with this. I'm taking a course offered by `deeplearning.ai` at Coursera, and this is a really great course having Andrew Ng as an instructor. He explains hard concepts which such ease that anyone would grasp the knowledge. Well, I finished some of my other pieces of stuff as well. But nothing more exciting than learning ML. Bye-bye...
        """,
  ))
  // Sick Day
  ..add(Activity(
    day: 07,
    month: 07,
    year: 2019,
    moodId: 3,
    title: "Fever sucks",
    note: """
        Dear Diary, 
        I am sorry, I can hardly express my day in words. I just reached home visiting a doctor. Yeah, you have guessed it right, I've got a fever and headache. So nothing much today, and you know what how this happened...well because I forgot my umbrella while going to college and see this is the result. I just hate the rainy season...
        """,
  ))
  // Happy Day
  ..add(Activity(
    day: 31,
    month: 12,
    year: 2020,
    moodId: 0,
    title: "Bye bye 2020",
    note: """
        Hey Diary,
        I know you are feeling sad because this is the last writing of the year for you. Still, it went great for me as I met my friends. We went to a party and had fun but left the party early as I wanted to end this year spending some quality time with family. And you know what...today, I made Chicken Biryani taking help from my mother. And everyone at home really liked it. This year brought some wonderful and cherishing moments into our lives along with COVID19 :P...Bye-bye Saayonara :)
        """,
  ));
