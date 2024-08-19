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
    apiKey: 'AIzaSyCfi4l3_ovyPLrpqwgMILIwKsvieYb05hM',
    appId: '1:486335990588:web:75cfcbb45f1a2117a56c39',
    messagingSenderId: '486335990588',
    projectId: 'food-app-afe4f',
    authDomain: 'food-app-afe4f.firebaseapp.com',
    databaseURL: 'https://food-app-afe4f-default-rtdb.firebaseio.com',
    storageBucket: 'food-app-afe4f.appspot.com',
    measurementId: 'G-WTTDB1GVK7',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmVn9t8rmubjaI_wwdqD0nH2IqYA9S37Y',
    appId: '1:486335990588:android:cb1148e25543379ca56c39',
    messagingSenderId: '486335990588',
    projectId: 'food-app-afe4f',
    databaseURL: 'https://food-app-afe4f-default-rtdb.firebaseio.com',
    storageBucket: 'food-app-afe4f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAEsYiU8lEaxOYTa6-pYNZRGNjSVQmgatI',
    appId: '1:486335990588:ios:6221444c635ed5b4a56c39',
    messagingSenderId: '486335990588',
    projectId: 'food-app-afe4f',
    databaseURL: 'https://food-app-afe4f-default-rtdb.firebaseio.com',
    storageBucket: 'food-app-afe4f.appspot.com',
    iosBundleId: 'com.example.foodApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyAEsYiU8lEaxOYTa6-pYNZRGNjSVQmgatI',
    appId: '1:486335990588:ios:2d06bffd8756bf8aa56c39',
    messagingSenderId: '486335990588',
    projectId: 'food-app-afe4f',
    databaseURL: 'https://food-app-afe4f-default-rtdb.firebaseio.com',
    storageBucket: 'food-app-afe4f.appspot.com',
    iosBundleId: 'com.example.foodApp.RunnerTests',
  );
}
