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
      tz.initializeTimeZones();
      tz.setLocalLocation(tz.getLocation(await currentTimeZone()));
      await _showNotification();
    }
  }

  Future<void> _showNotification() async {
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
    if (tz.TZDateTime.now(tz.local).hour == 10) {
      await localNotifications.show(
        4,
        'plain title',
        'plain body of notification',
        notificationDetails,
      );
    }
  }

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

  Future<void> scheduleDailyNotification() async {
    await localNotifications.zonedSchedule(
      1,
      'daily scheduled notification title',
      'daily scheduled notification body',
      _nextInstanceOfSelectedTime().add(Duration(seconds: 20)),
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

  tz.TZDateTime _nextInstanceOfSelectedTime() {
    final tz.TZDateTime now = tz.TZDateTime.now(tz.local);
    tz.TZDateTime scheduledDate =
        tz.TZDateTime.local(now.year, now.month, now.day, 19);
    if (scheduledDate.isBefore(now)) {
      scheduledDate = scheduledDate.add(const Duration(days: 1));
    }
    return scheduledDate;
  }
}
