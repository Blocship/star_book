import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/domain/repository/user_repo.dart';

class ProfileScreenCubit extends Cubit<Points> {
  JournalRepo journalRepo;

  final UserRepo userRepo;

  ProfileScreenCubit({
    required this.journalRepo,
    required this.userRepo,
  }) : super(Points.initial());

  Future<Points> getStreakAndPoint() async {
    final streak = await journalRepo.streak();
    final point = await journalRepo.point();
    return Points(streak: streak, point: point);
  }

  /// TODO: getUserName Function
  Future<String> getUserName(String userId) async {
    final user = await userRepo.getUser(userId: userId);
    return user.name;
  }
}

class Points {
  final int streak;
  final int point;

  const Points({
    required this.streak,
    required this.point,
  });

  factory Points.initial() => const Points(
        streak: 0,
        point: 0,
      );
}
