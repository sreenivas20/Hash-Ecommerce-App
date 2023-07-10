import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class Auth {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? get currentuser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<void> signInWithEmailAndPassword({
    required String email,
    required String passsword,
  }) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: passsword,
    );
  }

  Future<void> createUserWithEmailAndPassword({
    required String email,
    required String passsword,
  }) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: passsword,
    );
  }

  Future<void> signout() async {
    await _firebaseAuth.signOut();
    await GoogleSignIn().signOut();
  }

  static saveUser(String name, email, uid) async {
    await FirebaseFirestore.instance
        .collection('user')
        .doc(uid)
        .set({'email': email, 'name': name});
  }

  Future<void> savecredential(String name, email) async {
    saveUser(name, email, _firebaseAuth.currentUser!.uid);
  }

  Future<void> signinwithGoogle() async {
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    UserCredential userCredential =
        await _firebaseAuth.signInWithCredential(credential);
    print(userCredential.user?.displayName);
  }
}
