import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_native_timezone/flutter_native_timezone.dart';
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
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
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
