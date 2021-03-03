part of 'profile_page.dart';

/// Greeting widget displays greeting based on time.
class Greeting extends StatelessWidget {
  String greeting() {
    m.TimeOfDay timeOfDay = m.TimeOfDay.now();
    // greetings List contains various greeting messages.
    List greetings = ["Good Morning", "Good Night", "Hello"];
    if (timeOfDay.hour >= 6 && timeOfDay.hour <= 10) {
      return greetings[0];
    } else if (timeOfDay.hour >= 20 && timeOfDay.hour <= 24) {
      return greetings[1];
    } else {
      return greetings[2];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      greeting(),
      style: Style.largeTitle(context),
    );
  }
}
