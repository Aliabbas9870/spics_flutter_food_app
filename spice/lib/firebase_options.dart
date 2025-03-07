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
    apiKey: 'AIzaSyCT6OOMJoUfLRDrhviIFRyJbS2toUXU7lo',
    appId: '1:732018816743:web:514c661063b37579f35442',
    messagingSenderId: '732018816743',
    projectId: 'spice-safari-605ce',
    authDomain: 'spice-safari-605ce.firebaseapp.com',
    storageBucket: 'spice-safari-605ce.firebasestorage.app',
    measurementId: 'G-8XL94QN7NV',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD-Fhb4MPh354lvoYlBkiKreaC-zdyfN4E',
    appId: '1:732018816743:android:b5d798ddca1702cbf35442',
    messagingSenderId: '732018816743',
    projectId: 'spice-safari-605ce',
    storageBucket: 'spice-safari-605ce.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4tU26NmleklTZ73nAciy1k6vYyPqi4Uw',
    appId: '1:732018816743:ios:302c70714a65cf84f35442',
    messagingSenderId: '732018816743',
    projectId: 'spice-safari-605ce',
    storageBucket: 'spice-safari-605ce.firebasestorage.app',
    iosBundleId: 'com.example.spice',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyD4tU26NmleklTZ73nAciy1k6vYyPqi4Uw',
    appId: '1:732018816743:ios:302c70714a65cf84f35442',
    messagingSenderId: '732018816743',
    projectId: 'spice-safari-605ce',
    storageBucket: 'spice-safari-605ce.firebasestorage.app',
    iosBundleId: 'com.example.spice',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCT6OOMJoUfLRDrhviIFRyJbS2toUXU7lo',
    appId: '1:732018816743:web:0336eca76366d63af35442',
    messagingSenderId: '732018816743',
    projectId: 'spice-safari-605ce',
    authDomain: 'spice-safari-605ce.firebaseapp.com',
    storageBucket: 'spice-safari-605ce.firebasestorage.app',
    measurementId: 'G-PMHDTQMH5E',
  );
}
