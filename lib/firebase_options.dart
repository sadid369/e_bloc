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
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyAtLVUSjsZzPisPPkbLnZq9zjRowfz-ZVw',
    appId: '1:528498767303:web:4d1aeba271d6ca903ad5e2',
    messagingSenderId: '528498767303',
    projectId: 'flutter-e395f',
    authDomain: 'flutter-e395f.firebaseapp.com',
    storageBucket: 'flutter-e395f.appspot.com',
    measurementId: 'G-J21N76WQ9X',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDKh20cL3UQ-hDdlnVk7oeEZCnVN1XHQ88',
    appId: '1:528498767303:android:19a61a69d5ab14f53ad5e2',
    messagingSenderId: '528498767303',
    projectId: 'flutter-e395f',
    storageBucket: 'flutter-e395f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCLuvBGTVGZflQ2li5EQw1mcKFTbqmmSdg',
    appId: '1:528498767303:ios:8bab8b3efbbdfd053ad5e2',
    messagingSenderId: '528498767303',
    projectId: 'flutter-e395f',
    storageBucket: 'flutter-e395f.appspot.com',
    androidClientId: '528498767303-281gvpubo3p6mm3vjv6dr739u9gcvb9t.apps.googleusercontent.com',
    iosClientId: '528498767303-a7n5cv5f6vq0i1fi0u31m6i0g1uk7pk6.apps.googleusercontent.com',
    iosBundleId: 'com.example.blocEcommerce',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCLuvBGTVGZflQ2li5EQw1mcKFTbqmmSdg',
    appId: '1:528498767303:ios:8bab8b3efbbdfd053ad5e2',
    messagingSenderId: '528498767303',
    projectId: 'flutter-e395f',
    storageBucket: 'flutter-e395f.appspot.com',
    androidClientId: '528498767303-281gvpubo3p6mm3vjv6dr739u9gcvb9t.apps.googleusercontent.com',
    iosClientId: '528498767303-a7n5cv5f6vq0i1fi0u31m6i0g1uk7pk6.apps.googleusercontent.com',
    iosBundleId: 'com.example.blocEcommerce',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyAtLVUSjsZzPisPPkbLnZq9zjRowfz-ZVw',
    appId: '1:528498767303:web:4f9d807fc4cb0d673ad5e2',
    messagingSenderId: '528498767303',
    projectId: 'flutter-e395f',
    authDomain: 'flutter-e395f.firebaseapp.com',
    storageBucket: 'flutter-e395f.appspot.com',
    measurementId: 'G-CJ186LKTWL',
  );
}