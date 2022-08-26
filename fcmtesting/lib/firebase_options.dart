// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCkNR4Ro5062v-xRWUM-sv309Iix0VLH6o',
    appId: '1:382470337250:web:dbf2e0f3b50522fc4824bb',
    messagingSenderId: '382470337250',
    projectId: 'macro-mercury-351808',
    authDomain: 'macro-mercury-351808.firebaseapp.com',
    storageBucket: 'macro-mercury-351808.appspot.com',
    measurementId: 'G-FBD4H2816V',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBvW37yeEz1iEkfSP2Vd0WDFzaToeU-in0',
    appId: '1:382470337250:android:769b572c680e5a104824bb',
    messagingSenderId: '382470337250',
    projectId: 'macro-mercury-351808',
    storageBucket: 'macro-mercury-351808.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAg8ibzkv7NZR7gDqtbxJQdtzA_xANiC_8',
    appId: '1:382470337250:ios:51367449990b76144824bb',
    messagingSenderId: '382470337250',
    projectId: 'macro-mercury-351808',
    storageBucket: 'macro-mercury-351808.appspot.com',
    iosClientId: '382470337250-83k9oerfk7nmadsvom2ejqi5kimi0lc4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmtesting',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAg8ibzkv7NZR7gDqtbxJQdtzA_xANiC_8',
    appId: '1:382470337250:ios:51367449990b76144824bb',
    messagingSenderId: '382470337250',
    projectId: 'macro-mercury-351808',
    storageBucket: 'macro-mercury-351808.appspot.com',
    iosClientId: '382470337250-83k9oerfk7nmadsvom2ejqi5kimi0lc4.apps.googleusercontent.com',
    iosBundleId: 'com.example.fcmtesting',
  );
}