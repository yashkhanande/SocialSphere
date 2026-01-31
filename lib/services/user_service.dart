import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_sphere/models/user_model.dart';

class UserService  {

  final FirebaseFirestore _firebaseFirestore =  FirebaseFirestore.instance ;
  
  Future <AppUser> getUser(String userId) async {

    try{
      final user = await _firebaseFirestore.collection("users").doc(userId).get();
      return AppUser.fromMap(user.data());
    }catch(e){
      throw e.toString();
    }
  }
}