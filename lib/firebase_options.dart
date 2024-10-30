import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDWvamP5qdAassQtiDwRKQTgEgh7B0zg-8',
    appId: '1:905409049703:android:2eb20e3d92adb4c4a090c2',
    messagingSenderId: '905409049703',
    projectId: 'veterinaryapp-7e7d2',
    storageBucket: 'veterinaryapp-7e7d2.appspot.com',
  );

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDb19y03o2cKHbGw5XNoO3hR_c7jt1u1Js',
    appId: '1:905409049703:web:0de8fb40ba301cdda090c2',
    messagingSenderId: '905409049703',
    projectId: 'veterinaryapp-7e7d2',
    authDomain: 'veterinaryapp-7e7d2.firebaseapp.com',
    storageBucket: 'veterinaryapp-7e7d2.appspot.com',
    measurementId: 'G-H3GGKLD9XR',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDQR3vmENZ1wm3w1Ox54NVjs_4KqvBC4ro',
    appId: '1:905409049703:ios:ea780a21f1ab34aea090c2',
    messagingSenderId: '905409049703',
    projectId: 'veterinaryapp-7e7d2',
    storageBucket: 'veterinaryapp-7e7d2.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDQR3vmENZ1wm3w1Ox54NVjs_4KqvBC4ro',
    appId: '1:905409049703:ios:ea780a21f1ab34aea090c2',
    messagingSenderId: '905409049703',
    projectId: 'veterinaryapp-7e7d2',
    storageBucket: 'veterinaryapp-7e7d2.appspot.com',
    iosBundleId: 'com.example.flutterFirebase',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDb19y03o2cKHbGw5XNoO3hR_c7jt1u1Js',
    appId: '1:905409049703:web:6a6eed35ac2482b7a090c2',
    messagingSenderId: '905409049703',
    projectId: 'veterinaryapp-7e7d2',
    authDomain: 'veterinaryapp-7e7d2.firebaseapp.com',
    storageBucket: 'veterinaryapp-7e7d2.appspot.com',
    measurementId: 'G-8GM76VM92S',
  );

}