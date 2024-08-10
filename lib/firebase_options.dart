import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    return android;
  }

  static const FirebaseOptions android = FirebaseOptions(
      apiKey: 'AIzaSyDm9LdV2FZnpVs_xizuyCQVOu4Drl2viUk',
      appId: '1:303877638719:android:ac0b947c8ecf9067b7c68a',
      messagingSenderId: '303877638719',
      projectId: 'chat-44b8e',
      storageBucket: 'chat-44b8e.appspot.com'
    );
}
