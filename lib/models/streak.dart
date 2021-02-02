import 'dart:core';

import 'package:hive/hive.dart';
import 'package:collection/collection.dart';
import 'package:star_book/utils/date.dart';

// Files
import '../utils/constant.dart';
import '../models/activity.dart';
import '../controllers/global_setting.dart';

part '../models_hive_generated/streak.g.dart';

/// Represents the information related to a streak
///
/// `streakCount` : No. of days [Activity] is preformed
///
/// `streakStartDate` : Starting date of Streak
///
/// `streakEndDate` : Ending date of Streak
@HiveType(typeId: streakTypeId)
class StreakDataType {
  @HiveField(0)
  int streakCount;

  @HiveField(1)
  DateTime streakStartDate;

  @HiveField(2)
  DateTime streakEndDate;

  StreakDataType(this.streakCount, this.streakStartDate, this.streakEndDate);

  /// Method to compare priority of two [StreakDataType] objects
  ///
  /// As element that compares as less than another element has a higher priority in the priority queue
  /// If `a` compares less than `b` returns `-1` else `1`
  static int compare(StreakDataType a, StreakDataType b) {
    // `a`'s `streakCount` is more than `b`
    if (a.streakCount > b.streakCount)
      return -1;
    else if (a.streakCount < b.streakCount)
      return 1;
    else // if both have same `streakCount`, [StreakDataType] with latest `streakEndDate` has higher priority
      return (a.streakEndDate.isAtSameMomentAs(b.streakEndDate))
          ? 0
          : (a.streakEndDate.isAfter(b.streakEndDate))
              ? -1
              : 1;
  }

  /// Method to check whether `_date` lies in between `this.streakStartDate` and `this.streakEndDate`
  bool liesInStreak(DateTime _date) {
    return (!_date.isBefore(this.streakStartDate) &&
        !_date.isAfter(this.streakEndDate));
  }

  /// Comparision Operator
  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is StreakDataType &&
        this.streakCount == o.streakCount &&
        this.streakStartDate.isAtSameMomentAs(o.streakStartDate) &&
        this.streakEndDate.isAtSameMomentAs(o.streakEndDate);
  }

  @override
  int get hashCode {
    return streakCount.hashCode ^
        streakStartDate.hashCode ^
        streakEndDate.hashCode;
  }
}

/// Represents information related to all streaks of the app
class Streak {
  /// A variable that holds the streak information of all time
  ///
  /// A priority queue of [StreakDataType]s
  HeapPriorityQueue<StreakDataType> longestStreaks;

  /// A [StreakDataType] variable that represents information related to currentStreak/previousStreak
  StreakDataType currentStreak;

  /// Constructor for Creating a [Streak] object from a list of [StreakDataType] `lngStreaks` and `currentStreak`
  Streak(List<StreakDataType> lngStreaks, this.currentStreak) {
    longestStreaks = HeapPriorityQueue<StreakDataType>(StreakDataType.compare)
      ..addAll(lngStreaks);
  }

  /// Function to add the Latest consecutive activity streak
  void addActivityToStreak(Activity activity) {
    DateTime _activityDate =
            new DateTime(activity.year, activity.month, activity.day),
        _installedDate = GlobalSettingController.getInstalledDate();

    /// Assertion for validity of proper installation
    assert(_installedDate is DateTime);

    /// ! Comment this for Testing Purpose
    /// New [Activity] for a dat before today will not be counted in streak
    /// Streak will not be affected if an [Activity] is added for a date before today
    if (!_activityDate.isAtSameMomentAs(getDate(new DateTime.now()))) return;

    /// Update Longest Streaks Heap
    StreakDataType _streakToBeModified;
    longestStreaks.toUnorderedList().forEach((_streak) {
      if (_streak.liesInStreak(_activityDate.subtract(new Duration(days: 1)))) {
        _streakToBeModified = _streak;
      }
    });
    
    if (_streakToBeModified is StreakDataType) {
      longestStreaks.remove(_streakToBeModified);
    }

    ///Check whether current [Activity] is the first [Activity] of the app or not
    if (currentStreak == null) {
      currentStreak = new StreakDataType(1, _activityDate, _activityDate);
    } else {
      int daysTillLastActivity =
          _activityDate.difference(currentStreak.streakEndDate).inDays;

      /// Check whether the last [Activity] was yesterday
      if (daysTillLastActivity == 1) {
        currentStreak.streakCount++;
        currentStreak.streakEndDate = _activityDate;
      } else if (daysTillLastActivity > 1) {
        longestStreaks.add(currentStreak);
        currentStreak = new StreakDataType(1, _activityDate, _activityDate);
      }
    }

    /// Update `currentStreak` & `longestStreaks` in Hive
    GlobalSettingController.setCurrentStreak(currentStreak);
    longestStreaks.add(currentStreak);
    GlobalSettingController.setAllStreaks(longestStreaks.toUnorderedList());
  }

  /// Method to update the Streak after deletion of an [Activity]
  void deleteActivityFromStreak(Activity activity) {
    DateTime _activityDate =
        DateTime(activity.year, activity.month, activity.day);
    // Update Current Streak if the _date is present in currentStreak
    if (currentStreak != null && currentStreak.liesInStreak(_activityDate)) {
      // Delete Current Streak
      if (_activityDate.isAtSameMomentAs(currentStreak.streakStartDate) &&
          _activityDate.isAtSameMomentAs(currentStreak.streakEndDate)) {
        currentStreak = null;
      } else {
        // Split streak and update currentStreak with the lastest streak
        DateTime _startDate = currentStreak.streakStartDate,
            _endDate = currentStreak.streakEndDate;
        int _streakCount = currentStreak.streakCount;
        _startDate = _activityDate.add(new Duration(days: 1));
        _streakCount = _endDate.difference(_startDate).inDays + 1;

        currentStreak = new StreakDataType(_streakCount, _startDate, _endDate);

        // Update the hive database with Current Streak if current streak is valid
        if (!currentStreak.streakStartDate.isAfter(currentStreak.streakEndDate))
          GlobalSettingController.setCurrentStreak(currentStreak);
        else
          currentStreak = null;
      }
    }

    // Update Longest Streaks Heap
    StreakDataType _streakToBeModified;
    longestStreaks.toUnorderedList().forEach((_streak) {
      if (_streak.liesInStreak(_activityDate)) {
        _streakToBeModified = _streak;
      }
    });
    if (_streakToBeModified != null) {
      /// Split current streak into 2 parts: _firstPartStreak, _lastPartStreak
      /// Remove streak
      longestStreaks.remove(_streakToBeModified);

      /// Update the start and end streak dates of the splited streaks
      DateTime _firstPartStartDate = _streakToBeModified.streakStartDate,
          _firstPartEndDate = _activityDate.subtract(new Duration(days: 1)),
          _lastPartEndDate = _streakToBeModified.streakEndDate,
          _lastPartStartDate = _activityDate.add(new Duration(days: 1));

      /// Calculate streak count of these 2 streaks
      int _firstPartStreakCount =
              _firstPartEndDate.difference(_firstPartStartDate).inDays + 1,
          _lastPartStreakCount =
              _lastPartEndDate.difference(_lastPartStartDate).inDays + 1,
          _totalStreakCount = _streakToBeModified.streakCount;

      /// Assertion: Total Streak Count == Streak Count of 2 parts
      assert(_totalStreakCount ==
          (_firstPartStreakCount + _lastPartStreakCount + 1));

      StreakDataType _firstPartStreak, _lastPartStreak;

      /// Add the First Streak to all streaks if there exists a streak
      if (_firstPartStreakCount > 0) {
        _firstPartStreak = new StreakDataType(
            _firstPartStreakCount, _firstPartStartDate, _firstPartEndDate);

        longestStreaks.add(_firstPartStreak);
      }

      /// Add the Last Streak to all streaks if there exists a streak
      if (_lastPartStreakCount > 0) {
        _lastPartStreak = new StreakDataType(
            _lastPartStreakCount, _lastPartStartDate, _lastPartEndDate);
        longestStreaks.add(_lastPartStreak);
      }

      /// Update the hive database with Current Streak
      GlobalSettingController.setAllStreaks(longestStreaks.toUnorderedList());
    }
  }
}
