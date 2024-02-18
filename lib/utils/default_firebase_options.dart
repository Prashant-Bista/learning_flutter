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
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(

      apiKey: "AIzaSyAo5MrujNkXNcF23jnEPJrGdU00rqa2FVQ",
      authDomain: "flutter-project-learningfb.firebaseapp.com",
      projectId: "flutter-project-learningfb",
      storageBucket: "flutter-project-learningfb.appspot.com",
      messagingSenderId: "1016859674475",
      appId: "1:1016859674475:web:6be859ad1eb041a14aae2e"
  );

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: "AIzaSyAo5MrujNkXNcF23jnEPJrGdU00rqa2FVQ",
      authDomain: "flutter-project-learningfb.firebaseapp.com",
      projectId: "flutter-project-learningfb",
      storageBucket: "flutter-project-learningfb.appspot.com",
      messagingSenderId: "1016859674475",
      appId: "1:1016859674475:web:6be859ad1eb041a14aae2e"
  );

  static const FirebaseOptions ios = FirebaseOptions(
      apiKey: "AIzaSyAo5MrujNkXNcF23jnEPJrGdU00rqa2FVQ",
      authDomain: "flutter-project-learningfb.firebaseapp.com",
      projectId: "flutter-project-learningfb",
      storageBucket: "flutter-project-learningfb.appspot.com",
      messagingSenderId: "1016859674475",
      appId: "1:1016859674475:web:6be859ad1eb041a14aae2e"
  );

}