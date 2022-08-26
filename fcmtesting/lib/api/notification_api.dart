import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:rxdart/subjects.dart';

class NotificationApi {
  static final _notifications = FlutterLocalNotificationsPlugin();
  static final onNotifications = BehaviorSubject<String?>();

  static Future _notificationDetails() async {
    return NotificationDetails(
        android: AndroidNotificationDetails('channel id', 'channel name',
            importance: Importance.max),
        iOS: IOSNotificationDetails());
  }

  static Future init({bool initScheduled = false}) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('mipmap/ic_launcher');
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings();
    final MacOSInitializationSettings initializationSettingsMacOS =
        MacOSInitializationSettings();
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS,
            macOS: initializationSettingsMacOS);
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async =>
      _notifications.show(id, title, body, await _notificationDetails(),
          payload: payload);

  static displayForegroundNotification({
    int id = 0,
    String? title,
    String? body,
    String? payload,
  }) async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    final androidOptions =
        AndroidNotificationDetails('channel id', 'channel name',
            channelDescription: 'channel description',
            importance: Importance.max,
            priority: Priority.high,
            ticker: "A manually-sent push notification.",
            styleInformation: const DefaultStyleInformation(
              false,
              false,
            ));
    const iosOptions = IOSNotificationDetails(
        presentAlert: true, presentBadge: true, presentSound: true);
    final platformChannelSpecifics =
        NotificationDetails(android: androidOptions, iOS: iosOptions);
    await flutterLocalNotificationsPlugin.show(
        0, title, body, platformChannelSpecifics);
  }
}
