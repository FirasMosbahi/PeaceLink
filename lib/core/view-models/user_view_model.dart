import 'package:PeaceLink/core/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

//This class contains all the logic operations related to the users
class UserProvider {
  Future<bool> registerUser(
      {required UserModel user, required String password}) async {
    try {
      UserCredential userCredentials = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: user.email, password: password);
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredentials.user?.uid)
          .set(user.toJson());
    } catch (e) {
      throw Exception(e.toString());
    }
    return true;
  }

  Future<bool> authentificateUser(
      {required String email, required String password}) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      // if(FirebaseAuth.instance.currentUser?.emailVerified == false){
      //   await FirebaseAuth.instance.signOut();
      //   throw Exception("email not verified");
      // }
      return true;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> getUser(String id) async {
    try {
    DocumentSnapshot<Map<String,dynamic>> s =
          await FirebaseFirestore.instance.collection('users').doc(id).get();
    Map<String,dynamic> data = s.data() ?? {};
      return UserModel.fromJson(data);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<UserModel> getCurrentUser() async {
    try {
      return await getUser(FirebaseAuth.instance.currentUser?.uid ?? '');
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void updateUserInfos(Map<String, Object> changes) async {
    try {
      if (changes.containsKey("email")) {
        await FirebaseAuth.instance.currentUser
            ?.updateEmail(changes["email"].toString());
      }
      await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser?.uid)
          .update(changes);
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  void updateUserPassword({required String newPassword}) async {
    await FirebaseAuth.instance.currentUser?.updatePassword(newPassword);
  }

  void logOut() async {
    try {
      await FirebaseAuth.instance.signOut();
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
