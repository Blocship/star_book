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
  ))
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
        """
  ))
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
  // Normal Day
  ..add(Activity(
    day: 03,
    month: 01,
    year: 2021,
    moodId: 4,
    title: "Brought a Gift",
    note: """
        Hey Diary,
        Today I spent most of my time working on the project and planning the other features that would be nicer for a good user experience. In the evening I went to a gift shop to buy a gift for my mom since it's her birthday tomorrow. I hope she likes it! Now I have to do some preparations for giving her a surprise party :)
        Bye-bye diary
        """,
  ))
  // Happy Day
  ..add(Activity(
    day: 04,
    month: 01,
    year: 2021,
    moodId: 0,
    title: "Mom's Birthday",
    note: """
        Dear Diary,
        Today was wonderful!
        I am glad to tell you mom found the gift super adorable. She was amazed. It felt very nice seeing her so happy; we enjoyed it a lot. Then I gave some time to my ongoing project; later I explored concepts related to Robotic Process Automation (RPA); I found it fascinating the way our daily tasks can be automated using it. I finished some of my other pieces of stuff as well. Bye-bye, see you tom...
        """,
  ))
  // Productive Day
  ..add(Activity(
    day: 05,
    month: 01,
    year: 2021,
    moodId: 2,
    title: "Getting back to Work",
    note: """
        Hi Diary,
        I spent my day productively. I woke up at 7, did some exercise, and had my breakfast. And got back to my project, studied and explored blockchain. In the evening, I went for a walk in the park; I met one of my college fellows. We chatted about the classes, the college and the fun we have at the college. On my way home, I was in a reminiscing mood remembering the days spent with them. Then I had my dinner, worked on the project, and did other businesses. Bye-bye!!
        """,
  ))
  // Normal Day
  ..add(Activity(
    day: 06,
    month: 01,
    year: 2021,
    moodId: 4,
    title: "Sharing Stories",
    note: """
        Hey Diary,
        I think this app will be of great help for people to understand themselves. It would be a stress reliever. I know that the only way to get people to share their stories is through writing. I need to do a little research. Writing is a powerful tool that can help people connect and feel better after sharing their feelings if they want to share them with other people too. It'd be good if people keep a journal to share their thoughts, experiences, and feelings, leading to a better understanding of relationships, but I wonder if they would be okay with this! Bye-bye dear diary,
        See you tom...
        """,
  ))
  // Productive Day
  ..add(Activity(
    day: 07,
    month: 01,
    year: 2021,
    moodId: 2,
    title: "Day spent well!",
    note: """
        Dear Diary, 
        Following the daily routine, I started my day with some exercise and a hearty breakfast. After that, I dedicated some quality time to my open-ended project and planned newer features to be added, as an improvement. I helped my mentees. It was an amazing day, and I spent it productively learning new things and techniques to be better. Bye-bye diary :)
        """,
  ))
  // Angry Day
  ..add(Activity(
    day: 08,
    month: 01,
    year: 2021,
    moodId: 5,
    title: "A decision to make?",
    note: """
        What a day!
        Do you ever feel stuck when you have big decisions to make?
        What do you suppose that paralyzes us during times when it seems the best thing to do is act? 
        Is that mandatory pause our self's way of asking us to take a step back lest we make hasty decisions?
        ...Or is the pause our unproductive way of addressing our fear of change?
        I don't know! What should I do when I feel pressure?
        Should we pause, or take a deep breath, should I proceed despite the apprehension?
        Still in confusion and a bit frustrated
        Bye diary.
        """,
  ))
  // Normal Day
  ..add(Activity(
    day: 09,
    month: 01,
    year: 2021,
    moodId: 4,
    title: "A Divine Inspiration!",
    note: """
        Today I started my day, as usual, woke up at 7. Then I did the routine work, then got to my work, spent some quality time on the project. Then, resolving some issues in the project. And I watched a video on youtube, and a divine inspiration struck my mind. The video conveys a message that we should change our hearts to change the world, always treat everybody nicely, no matter, however, they behave with us. It was an inspiring note.
        Bye-bye :)
        """,
  ))
  // Happy Day
  ..add(Activity(
    day: 10,
    month: 01,
    year: 2021,
    moodId: 0,
    title: "Family Picnic",
    note: """
        I woke up at 6, before everyone else. Feels great!
        It's Sunday today, so I took a break from the daily schedule and decided to spend some time with my family. So, I packed some sandwiches as snacks, and then all of us dressed. We watched a movie, spend the afternoon nicely, came back home at 8. Then I helped my mother in preparing the dinner. It was a great day.
        Goodbye :)
        """,
  ))
  // Sick Day
  ..add(Activity(
    day: 11,
    month: 01,
    year: 2021,
    moodId: 3,
    title: "Headache",
    note: """
        Dear Diary,
        Today felt like the longest day of my life. I had a headache so, couldn't focus on anything. The never-ending pain was disturbing me. So, I visited the doctor; he gave me the medicines, even though I was not feeling good. It's just now that the pain has become mild. I think I should have a good sleep. I just hate this day...
        """,
  ))
  // Sad Day
  ..add(Activity(
    day: 12,
    month: 01,
    year: 2021,
    moodId: 1,
    title: "Slightly off!",
    note: """
        Today was my first day in the new class. It was slightly off. I was not to get whatever the teacher was explaining. After finishing all my online classes, I decided to spend some time on the ongoing project but I was not able to concentrate. I don't know why I was feeling sad today...
        """,
  ))
  // Productive Day
  ..add(Activity(
    day: 13,
    month: 01,
    year: 2021,
    moodId: 2,
    title: "Worked on the project",
    note: """
        Today I woke up at 7 a.m. according to my daily routine. And decided that I'll be spending my day productively and will focus on utilizing my time for enhancing the design of the project. I have been working on it the whole day long, explored various things that I can integrate to make this project better. 
        Goodbye 
        """,
  ))
  // Happy Day
  ..add(Activity(
    day: 14,
    month: 01,
    year: 2021,
    moodId: 0,
    title: "A wonderful day!",
    note: """
        Today was a wonderful day. And not only because of massive career accomplishments. Today was just simple and perfect because today was just me and my mom driving around, looking at antiques in little antique shops, and chatting. We stopped for ice cream cones. It started raining hard, while we were shopping, so we had to run back to the car. We met up with dad and my brother for dinner in Nashville. Got back home at 10, then I gave two to three hours to the ongoing project.
        Bye Diary :)
        """,
  ))
  // Productive Day
  ..add(Activity(
    day: 15,
    month: 01,
    year: 2021,
    moodId: 2,
    title: "Day spent productively",
    note: """
        There's a world within a day. There are so many stages and moments to savor within every day. Then I gave some time to the ongoing project and explored cryptography and ethical hacking. It seemed so cool to me. Overall, I spent my day productively!! Bye-bye diary, see you tom...
        """,
  ))
  // Happy Day
  ..add(Activity(
    day: 16,
    month: 01,
    year: 2021,
    moodId: 0,
    title: "I helped a little one!",
    note: """
        As usual, I woke up at 7, did some exercise following up with my daily routine, had my breakfast, and then spend some quality time on the ongoing project. In the evening I went cycling, saw a hungry little boy, asking for food, it was sad to see nobody's helping him. I bought him some food and it was great to see him happy. I asked him if he's attending school. He replied in negative, but he wanted to study. So I asked one of my neighbors if she could teach him and thankfully she agreed. I'm so happy for him.
        Goodbye Diary
        """,
  ))
  // Happy Day
  ..add(Activity(
    day: 17,
    month: 01,
    year: 2021,
    moodId: 0,
    title: "Day spent well!",
    note: """
        Today, I woke up at 6:30, and after having my breakfast. I started working on the project. It was quite interesting. In the evening, our relatives visited us. I was still working on this project, and my cousin came and saw the app. He was amazed to know the idea behind it, an electronic personal diary. He asked me to give him the app whenever it gets finished. I was so glad to get such a good review.
        Bye-bye diary,
        See you tom...
        """,
  ));
