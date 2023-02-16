import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_for_peace/core/models/user-model.dart';

class UserProvider{
  void registerUser({required UserModel user, required String password})async{
    try{
      final userCredentials = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: user.email, password: password);
      await FirebaseFirestore.instance.collection('user').doc(userCredentials.user?.uid).set(user.toJson());
    }catch(e){
      throw Exception(e.toString());
    }
  }
  void authentificateUser({required String email , required String password})async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
      if(FirebaseAuth.instance.currentUser?.emailVerified == false){
        await FirebaseAuth.instance.signOut();
        throw Exception("email not verified");
      }
      await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).update({"isConnected" : true});
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<UserModel> getUser(String id)async{
    try{
      DocumentSnapshot s = await FirebaseFirestore.instance.collection('user').doc(id).get();
      Map<String,dynamic> data = s.data() as Map<String,dynamic>;
      return UserModel.fromJson(data);
    }catch(e){
      throw Exception(e.toString());
    }
  }
  Future<UserModel> getCurrentUser()async{
    try{
      return await getUser(FirebaseAuth.instance.currentUser?.uid ?? '');
    }catch(e){
      throw Exception(e.toString());
    }
  }
  void updateUser(Map<String,Object> changes)async{
    try{
      if(changes.containsKey("email")){
        FirebaseAuth.instance.currentUser?.updateEmail(changes["email"].toString());
      }
      await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).update(changes);
    }catch(e){
      throw Exception(e.toString());
    }
  }
  void logOut()async{
    try{
      await FirebaseFirestore.instance.collection('user').doc(FirebaseAuth.instance.currentUser?.uid).update({"isConnected" : false});
      await FirebaseAuth.instance.signOut();
    }catch(e){
      throw Exception(e.toString());
    }
  }
}