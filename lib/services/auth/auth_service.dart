import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  User? getCurrentUser() {
    return _firebaseAuth.currentUser;
  }

  Future<UserCredential> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _firebaseFirestore.collection('Users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          email: email,
        },
        SetOptions(merge: true),
      );
      return userCredential;
    } on FirebaseException catch (error) {
      throw Exception(error.code);
    }
  }

  Future<UserCredential> signUpWithEmailAndPassword(
      String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _firebaseFirestore.collection('Users').doc(userCredential.user!.uid).set(
        {
          'uid': userCredential.user!.uid,
          'email': email,
        },
      );
      return userCredential;
    } on FirebaseException catch (error) {
      throw Exception(error.code);
    }
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String getErrorMessage(String errorcode) {
    switch (errorcode) {
      case 'Exception wrong-password':
        return 'סיסמה שגויה. נסה שוב';
      case 'Exception user-not-found':
        return 'לא נמצא משתמש בדוא"ל זה. אנא הירשם';
      case 'Exception invalid-email':
        return 'דוא"ל אינו קיים';
      default:
        return 'ארעה שגיאה';
    }
  }
}
