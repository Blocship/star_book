// ignore_for_file: unused_element

import 'package:isar/isar.dart';
import 'package:kiwi/kiwi.dart';
import 'package:star_book/data/data_source/local_data_source/journal_api.dart';
import 'package:star_book/data/data_source/local_data_source/mood_api.dart';
import 'package:star_book/data/data_source/local_data_source/user_api.dart';
import 'package:star_book/data/models/journal/journal.dart';
import 'package:star_book/data/models/mood/mood.dart';
import 'package:star_book/data/models/user/user.dart';
import 'package:star_book/data/repository/journal_repo.dart';
import 'package:star_book/data/repository/mood_repo.dart';
import 'package:star_book/data/repository/user_repo.dart';
import 'package:star_book/domain/repository/journal_repo.dart';
import 'package:star_book/domain/repository/mood_repo.dart';
import 'package:star_book/domain/repository/user_repo.dart';

abstract class Injector {
  // maybe pass config
  static Future<void> initialise() async {
    _Injector()._initialise();
  }

  static final resolve = KiwiContainer().resolve;
  static final unregister = KiwiContainer().unregister;
  static final clear = KiwiContainer().clear;

  void _initialise();
  void _initialisesServices();
  void _initialiseDatasource();
  void _initialiseRepositories();
}

class _Injector extends Injector {
  @override
  void _initialise() {
    _initialisesServices();
    _initialiseDatasource();
    _initialiseRepositories();
  }

  @override
  void _initialisesServices() {}

  @override
  void _initialiseDatasource() {
    final KiwiContainer container = KiwiContainer();
    final Isar isar = Isar.getInstance()!;
    container
      ..registerFactory<IJournalApi>((c) => LSJournalApi(
          journalCollection: isar.collection<Journal>(),
          moodCollection: isar.collection<Mood>()))
      ..registerFactory<IMoodApi>(
          (c) => LSMoodApi(collection: isar.collection<Mood>()))
      ..registerFactory<IUserApi>(
          (c) => LSUserApi(collection: isar.collection<User>()));
  }

  @override
  void _initialiseRepositories() {
    final KiwiContainer container = KiwiContainer();
    container
      ..registerFactory<JournalRepo>(
          (c) => JournalRepoImpl(lsJournalApi: c<IJournalApi>()))
      ..registerFactory<MoodRepo>((c) => MoodRepoImpl(
          lSMoodApi: c<IMoodApi>(), lSJournalApi: c<IJournalApi>()))
      ..registerFactory<UserRepo>(
          (c) => UserRepoImpl(lSUserApi: c<IUserApi>()));
  }
}
