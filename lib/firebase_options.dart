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
    apiKey: 'AIzaSyC9hAcGhA1GDm5pKBU6QNFqu55xz6XjNQs',
    appId: '1:79229519131:web:a3d15f2a472fb9c53fffbe',
    messagingSenderId: '79229519131',
    projectId: 'coinwrap-f0fd5',
    authDomain: 'coinwrap-f0fd5.firebaseapp.com',
    storageBucket: 'coinwrap-f0fd5.appspot.com',
    measurementId: 'G-WBFWPWV1R1',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDCx-uJU9FnwvzplZNsboYpI4-bORzzVks',
    appId: '1:79229519131:android:478a4cebd3ab8aee3fffbe',
    messagingSenderId: '79229519131',
    projectId: 'coinwrap-f0fd5',
    storageBucket: 'coinwrap-f0fd5.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBhx08MojR26NWmsISL-YkcD0H2ItREgOs',
    appId: '1:79229519131:ios:3c0ee0fe6882fe6f3fffbe',
    messagingSenderId: '79229519131',
    projectId: 'coinwrap-f0fd5',
    storageBucket: 'coinwrap-f0fd5.appspot.com',
    iosClientId: '79229519131-1qkqlf51emrp5gks9349i8dmankd6c7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.coinFlutter',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBhx08MojR26NWmsISL-YkcD0H2ItREgOs',
    appId: '1:79229519131:ios:3c0ee0fe6882fe6f3fffbe',
    messagingSenderId: '79229519131',
    projectId: 'coinwrap-f0fd5',
    storageBucket: 'coinwrap-f0fd5.appspot.com',
    iosClientId: '79229519131-1qkqlf51emrp5gks9349i8dmankd6c7d.apps.googleusercontent.com',
    iosBundleId: 'com.example.coinFlutter',
  );
}
