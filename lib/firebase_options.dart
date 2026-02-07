import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      throw UnsupportedError('Web is not supported');
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAqJU9yOiYj_Jm78RyJjuwM-4O2fXxRYKw',
    appId: '1:869025959176:android:2b2add7cff11bd2b5230bd',
    messagingSenderId: '869025959176',
    projectId: 'expense-tracker-5f5cc',
    storageBucket: 'expense-tracker-5f5cc.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAqJU9yOiYj_Jm78RyJjuwM-4O2fXxRYKw',
    appId: '1:869025959176:ios:2b2add7cff11bd2b5230bd',
    messagingSenderId: '869025959176',
    projectId: 'expense-tracker-5f5cc',
    storageBucket: 'expense-tracker-5f5cc.firebasestorage.app',
    iosBundleId: 'com.example.expenseTracker',
  );
}