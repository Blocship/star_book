part of 'profile_page.dart';

/// Stats widget display User's activity stats like:
/// - Points (Total number of activites)
/// - Streak (Latest consecutive activity count)
class Stats extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: c.MainAxisAlignment.spaceAround,
      children: [
        MyContainer(
          width: MediaQuery.of(context).size.width / 2 - 32,
          margin: EdgeInsets.zero,
          child: Column(
            crossAxisAlignment: c.CrossAxisAlignment.start,
            children: [
              Text(
                ActivityController.points().toString(),
                style: Style.title(context),
              ),
              SizedBox(height: 6),
              Text(
                'Entries',
                style: Style.bodySecondary(context),
              )
            ],
          ),
        ),
        MyContainer(
          margin: EdgeInsets.zero,
          width: MediaQuery.of(context).size.width / 2 - 32,
          child: Column(
            crossAxisAlignment: c.CrossAxisAlignment.start,
            children: [
              Text(
                ActivityController.streak().toString(),
                style: Style.title(context),
              ),
              SizedBox(height: 6),
              Text(
                'Streak',
                style: Style.bodySecondary(context),
              )
            ],
          ),
        ),
      ],
    );
  }
}
