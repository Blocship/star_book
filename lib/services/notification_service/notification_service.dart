import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:star_book/models/activity.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz;

class NotificationService {
  FlutterLocalNotificationsPlugin localNotifications =
      FlutterLocalNotificationsPlugin();

  Future<void> notificationInitialization() async {
    tz.initializeTimeZones();
    tz.setLocalLocation(tz.getLocation(await currentTimeZone()));
    FlutterLocalNotificationsPlugin localNotifications =
        FlutterLocalNotificationsPlugin();
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings(
      'app_icon',
    );
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );
    //TODO: Passing a function to onSelectNotification which fires up when a notification
    //is tapped, navigating the user to other page or doing something else
    await localNotifications.initialize(initializationSettings);
  }

  Future<String> currentTimeZone() async {
    return await FlutterNativeTimezone.getLocalTimezone();
  }

  /// A function to check whether the user has written
  /// his diary for yesterday. If not, calling [_schedule10AMNotification]
  /// to schedule a notification
  Future<void> checkDiary() async {
    await Hive.initFlutter();
    if (!Hive.isAdapterRegistered(0)) {
      Hive.registerAdapter<Activity>(ActivityAdapter());
    }
    var box = await Hive.openBox<Activity>(activityBoxName);
    DateTime time = DateTime.now().subtract(Duration(days: 1));
    String id = (time.day + time.month + time.year).toString();
    var value = box.get(id);
    print(value);
    if (value == null) {
      await notificationInitialization();
      var pendingNotificationsList =
          await localNotifications.pendingNotificationRequests();
      if (!pendingNotificationsList.contains(2)) {
        await _schedule10AMNotification();
      }
    } else if (value != null) {
      await localNotifications.cancel(2);
    }
  }

  /// SCheduling a notification to show at 10 AM
  /// TODO: Providing descriptive and meaningful title
  /// and description for the notification
  Future<void> _schedule10AMNotification() async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      'channel id',
      'channel name',
      'channel description',
      importance: Importance.max,
    );
    const IOSNotificationDetails iosNotificationDetails =
        IOSNotificationDetails(
      badgeNumber: 1,
    );
    const NotificationDetails notificationDetails = NotificationDetails(
      android: androidNotificationDetails,
      iOS: iosNotificationDetails,
    );
    await localNotifications.zonedSchedule(
      2,
      'notification title',
      'notification body',
      _nextInstanceOfSelectedTime(10, 0),
      notificationDetails,
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Requesting permission to show notifications
  /// on [iOS]
  Future<bool> iosNotificationPermission() async {
    return await localNotifications
        .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  /// SCheduling a notification to show everyday at a specifice time
  /// TODO: Providing descriptive and meaningful name
  /// and description for the notification
  Future<void> scheduleDailyNotification({int hour, int minutes}) async {
    await localNotifications.zonedSchedule(
      1,
      'daily scheduled notification title',
      'daily scheduled notification body',
      _nextInstanceOfSelectedTime(hour, minutes),
      const NotificationDetails(
        android: AndroidNotificationDetails(
          'daily notification channel id',
          'daily notification channel name',
          'daily notification description',
        ),
        iOS: IOSNotificationDetails(
          presentAlert: true,
          presentBadge: true,
          presentSound: true,
          subtitle: 'notification subtitle',
        ),
      ),
      androidAllowWhileIdle: true,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
      matchDateTimeComponents: DateTimeComponents.time,
    );
  }

  /// Checking whether the time selected by the user falls
  /// before or after the current date.
  tz.TZDateTime _nextInstanceOfSelectedTime(int hour, int minutes) {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime.local(now.year, now.month, now.day, hour, minutes);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
