import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/domain/repository/user_repo.dart';
import 'package:star_book/presentation/injector/injector.dart';

class RepositoryBarrel {
  static final userRepo = Injector.resolve<UserRepo>();
  static final moodRepo = Injector.resolve<MoodRepo>();
  static final journalRepo = Injector.resolve<JournalRepo>();

  static Future<void> initialize() async {
    Future.wait([
      userRepo.initialize(),
      moodRepo.initialize(),
      journalRepo.initialize(),
    ]);
  }
}
