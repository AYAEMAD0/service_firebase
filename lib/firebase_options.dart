import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBoZHvnCpBcZKnrlkbW89XAD0Xr-k7NtUE',
    appId: '1:694813744790:android:52b41418706c93d6a92cb7',
    messagingSenderId: '694813744790',
    projectId: 'depi-fc3c2',
    storageBucket: 'depi-fc3c2.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBoZHvnCpBcZKnrlkbW89XAD0Xr-k7NtUE',
    appId: '1:694813744790:ios:4c15ffb9633076c0a92cb7',
    messagingSenderId: '694813744790',
    projectId: 'depi-fc3c2',
    storageBucket: 'depi-fc3c2.firebasestorage.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBoZHvnCpBcZKnrlkbW89XAD0Xr-k7NtUE',
    appId: '1:694813744790:ios:4c15ffb9633076c0a92cb7',
    messagingSenderId: '694813744790',
    projectId: 'depi-fc3c2',
    storageBucket: 'depi-fc3c2.firebasestorage.app',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBoZHvnCpBcZKnrlkbW89XAD0Xr-k7NtUE',
    appId: '1:694813744790:web:85a6305975d9130fa92cb7',
    messagingSenderId: '694813744790',
    projectId: 'depi-fc3c2',
    storageBucket: 'depi-fc3c2.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBoZHvnCpBcZKnrlkbW89XAD0Xr-k7NtUE',
    appId: '1:694813744790:web:e10e01a337e455eaa92cb7',
    messagingSenderId: '694813744790',
    projectId: 'depi-fc3c2',
    storageBucket: 'depi-fc3c2.firebasestorage.app',
  );
}
