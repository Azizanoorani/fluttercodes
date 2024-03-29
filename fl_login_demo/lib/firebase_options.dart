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
    apiKey: 'AIzaSyDFE__SMn-BElqHGwVWKIaW7ZoTbFuzP-4',
    appId: '1:338037527290:web:62a0b4fc00a681087e2f43',
    messagingSenderId: '338037527290',
    projectId: 'fir-63b52',
    authDomain: 'fir-63b52.firebaseapp.com',
    storageBucket: 'fir-63b52.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAdT_tdhuQFYKO-h1u3Xvv5dypRCOZIyf4',
    appId: '1:338037527290:android:3ba5c1c7516fec757e2f43',
    messagingSenderId: '338037527290',
    projectId: 'fir-63b52',
    storageBucket: 'fir-63b52.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBeRwc5VY9qLYL-p7mGUgdFCd-NY0tECdw',
    appId: '1:338037527290:ios:31d3422ee52ec5987e2f43',
    messagingSenderId: '338037527290',
    projectId: 'fir-63b52',
    storageBucket: 'fir-63b52.appspot.com',
    androidClientId: '338037527290-vr82ip47irj6rrc5anjaeu8d0q1qbf2l.apps.googleusercontent.com',
    iosClientId: '338037527290-j6v72n319hf6b9kmg84pptj8fnsn67ui.apps.googleusercontent.com',
    iosBundleId: 'com.example.flLoginDemo',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBeRwc5VY9qLYL-p7mGUgdFCd-NY0tECdw',
    appId: '1:338037527290:ios:d47138321c04981e7e2f43',
    messagingSenderId: '338037527290',
    projectId: 'fir-63b52',
    storageBucket: 'fir-63b52.appspot.com',
    androidClientId: '338037527290-vr82ip47irj6rrc5anjaeu8d0q1qbf2l.apps.googleusercontent.com',
    iosClientId: '338037527290-pcqbct7mvj1636ssa9vq82f1r7p5t7do.apps.googleusercontent.com',
    iosBundleId: 'com.example.flLoginDemo.RunnerTests',
  );
}
