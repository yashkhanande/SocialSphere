import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<User?> signUp(String email, String password) async {
    try {
      final cred = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return cred.user!;
    } catch (e) {
      // throw Exception(e.toString());
      throw Exception(e.toString());
    }
  }

  Future<User?> login(String email, String password) async {
    try {
      final cred = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      
      return cred.user!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logOut() async {
    await auth.signOut();
  }
}
