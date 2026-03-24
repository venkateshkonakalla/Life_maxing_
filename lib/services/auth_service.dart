import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'firestore_service.dart';

class AuthService {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // ✅ Login With Email
  static Future<User?> loginEmail(String email, String password) async {
    final cred = await _auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return cred.user;
  }

  // ✅ Sign Up With Email
  static Future<User?> signupEmail(String email, String password) async {
    final cred = await _auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );

    await FirestoreService.createUser(cred.user!);
    return cred.user;
  }

  // ✅ Google Login
  static Future<User?> signInWithGoogle() async {
    final googleUser = await GoogleSignIn().signIn();
    if (googleUser == null) return null;

    final googleAuth = await googleUser.authentication;

    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    final userCred = await _auth.signInWithCredential(credential);

    if (userCred.additionalUserInfo!.isNewUser) {
      await FirestoreService.createUser(userCred.user!);
    }

    return userCred.user;
  }

  // ✅ Logout
  static Future<void> logout() async {
    await GoogleSignIn().signOut();
    return _auth.signOut();
  }

  // ✅ Delete Account Completely
  static Future<void> deleteAccount() async {
    final user = _auth.currentUser;
    if (user == null) return;

    await FirestoreService.deleteAllUserData(user.uid);
    await user.delete();
  }
}
``
