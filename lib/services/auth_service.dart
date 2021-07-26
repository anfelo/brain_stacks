import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:async';

class AuthService {
  final GoogleSignIn _googleSignIn = GoogleSignIn();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  User? get user => _auth.currentUser;

  Stream<User?> get authChanges => _auth.userChanges();

  Future<User?> googleSignIn() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      GoogleSignInAuthentication googleAuth =
          await googleSignInAccount!.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      User? user = (await _auth.signInWithCredential(credential)).user;
      // updateUserData(user);

      return user;
    } catch (error) {
      print(error);
      return null;
    }
  }

  Future<User?> anonLogin() async {
    User? user = (await _auth.signInAnonymously()).user;
    // updateUserData(user);
    return user;
  }

  // Future<void> updateUserData(User user) {
  //   DocumentReference financesRef = _db.collection('finances').doc(user.uid);

  //   return financesRef.set(
  //     {'uid': user.uid, 'lastActivity': DateTime.now()},
  //     SetOptions(merge: true),
  //   );
  // }

  Future<void> signOut() {
    return _auth.signOut();
  }
}
