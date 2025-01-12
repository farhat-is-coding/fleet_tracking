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
    apiKey: 'AIzaSyBt_p2rVMIpYpM8frre-JduK4Pd4l1GE4I',
    appId: '1:684476869658:web:293ef91c297e249ac4f5a3',
    messagingSenderId: '684476869658',
    projectId: 'tracker-blitz',
    authDomain: 'tracker-blitz.firebaseapp.com',
    storageBucket: 'tracker-blitz.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCycFh3Hy2f8xeY3w9eNgSora969ckb4Qc',
    appId: '1:684476869658:android:ad20028f154d9200c4f5a3',
    messagingSenderId: '684476869658',
    projectId: 'tracker-blitz',
    storageBucket: 'tracker-blitz.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCcNgDXFKuqLZYTi2QsPVNUlqDT0tGB4GE',
    appId: '1:684476869658:ios:9899285133cadcfcc4f5a3',
    messagingSenderId: '684476869658',
    projectId: 'tracker-blitz',
    storageBucket: 'tracker-blitz.firebasestorage.app',
    iosBundleId: 'com.example.fleetTracker',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCcNgDXFKuqLZYTi2QsPVNUlqDT0tGB4GE',
    appId: '1:684476869658:ios:9899285133cadcfcc4f5a3',
    messagingSenderId: '684476869658',
    projectId: 'tracker-blitz',
    storageBucket: 'tracker-blitz.firebasestorage.app',
    iosBundleId: 'com.example.fleetTracker',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBt_p2rVMIpYpM8frre-JduK4Pd4l1GE4I',
    appId: '1:684476869658:web:e5f8211d7f2e5d82c4f5a3',
    messagingSenderId: '684476869658',
    projectId: 'tracker-blitz',
    authDomain: 'tracker-blitz.firebaseapp.com',
    storageBucket: 'tracker-blitz.firebasestorage.app',
  );

}