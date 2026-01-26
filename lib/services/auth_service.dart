import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future <User?> signIn(String email, String password) async{
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future <User?> login(String email , String password) async{
    UserCredential userCredential = await auth.signInWithEmailAndPassword(email: email, password: password);
    return userCredential.user;
  }

  Future <void> logOut() async{
    await auth.signOut();
  }

  Stream <User?> authState() {
    return auth.authStateChanges();
  }

}