// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyDF6vSIoMhbLafLSuxKVb0qMGMFKhMSJXE',
    appId: '1:997427448557:web:2e167159e3acdea9461ae4',
    messagingSenderId: '997427448557',
    projectId: 'seth-notes-app',
    authDomain: 'seth-notes-app.firebaseapp.com',
    databaseURL: 'https://seth-notes-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'seth-notes-app.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyATEY_fD_yvMbveznJBIVHIS4UOEbRzC3Y',
    appId: '1:997427448557:android:fd13d96fbf47bb5e461ae4',
    messagingSenderId: '997427448557',
    projectId: 'seth-notes-app',
    databaseURL: 'https://seth-notes-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'seth-notes-app.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD6S3R-Dmss5YkSYXL2JAzyYHDcyX4LJsk',
    appId: '1:997427448557:ios:31546547332e9482461ae4',
    messagingSenderId: '997427448557',
    projectId: 'seth-notes-app',
    databaseURL: 'https://seth-notes-app-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'seth-notes-app.firebasestorage.app',
    iosBundleId: 'com.example.notesfb',
  );

}