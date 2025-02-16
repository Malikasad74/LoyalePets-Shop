import 'package:firebase_auth/firebase_auth.dart';

class AuthServices {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  // Sign Up User
  Future<String> signUpUser({
    required String email,
    required String password,
    required String name,
  }) async {
    try {
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user != null) {
        await userCredential.user!.updateDisplayName(name);
      }

      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred.";
    }
  }

  // Login User
  Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      return "success";
    } on FirebaseAuthException catch (e) {
      return e.message ?? "An error occurred.";
    }
  }
  // for logout

  Future<void> signOut() async{
    await _auth.signOut();
  }
}