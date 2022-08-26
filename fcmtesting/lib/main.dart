import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fcmtesting/firebase_options.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:fcmtesting/api/notification_api.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // Background Notification handler
  await Firebase.initializeApp();

  print("Handling a background message: ${message.messageId}");
}

checkForInitialMessage() async {
  // Terminated Notification handler
  await Firebase.initializeApp();
  RemoteMessage? initialMessage =
      await FirebaseMessaging.instance.getInitialMessage();
  if (initialMessage != null) {
    print('Message contained notification: ${initialMessage.notification}}');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  // Init local Notification
  NotificationApi.init();

  NotificationSettings settings = await messaging.requestPermission(
      alert: true,
      announcement: true,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true);
  print('User granted permission: ${settings.authorizationStatus}');

  // Getting FCM Token
  messaging.getToken().then((token) => print(token));

  // Foreground Notification
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    print('Message whilst in the foreground');
    print('Message data: ${message.data}');
    if (message.notification != null) {
      print('Message contained notification: ${message.notification}');
      NotificationApi.displayForegroundNotification(
          title: message.notification!.title, body: message.notification!.body);
    }
  });

  // Background Notification
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  // Terminated Notification
  checkForInitialMessage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
