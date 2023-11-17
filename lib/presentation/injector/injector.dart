// ignore_for_file: unused_element

import 'package:isar/isar.dart';
import 'package:kiwi/kiwi.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:star_book/app_settings.dart';
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
import 'package:star_book/firebase.dart';

abstract class Injector {
  // maybe pass config
  static Future<void> initialise() async {
    return _Injector()._initialise();
  }

  static final resolve = KiwiContainer().resolve;
  static final unregister = KiwiContainer().unregister;
  static final clear = KiwiContainer().clear;

  Future<void> _initialise();

  Future<void> _initialisesServices();

  Future<void> _initialiseDatasource();

  Future<void> _initialiseRepositories();
}

class _Injector extends Injector {
  @override
  Future<void> _initialise() async {
    await _initialisesServices();
    await _initialiseDatasource();
    await _initialiseRepositories();
  }

  @override
  Future<void> _initialisesServices() async {
    final KiwiContainer container = KiwiContainer();
    final SharedPreferences preferences = await SharedPreferences.getInstance();
    container
      ..registerSingleton<AppSettings>((c) => AppSettingsImpl(preferences))
      ..registerSingleton<FirebaseService>((c) {
        final service = FirebaseService();
        print('initialising firebase service');
        service.initialise();
        return service;
      })
      ..registerSingleton<ReportingService>((c) {
        final reportingService = ReportingService();
        print('initialising reporting service');
        reportingService.initialise();
        return reportingService;
      })
      ..registerSingleton<AnalyticsService>((c) {
        final analyticsService = AnalyticsService();
        print('initialising analytics service');
        analyticsService.initialise();
        return analyticsService;
      });
  }

  @override
  Future<void> _initialiseDatasource() async {
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
  Future<void> _initialiseRepositories() async {
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
