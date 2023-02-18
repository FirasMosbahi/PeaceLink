import 'package:chat_for_peace/core/models/idea_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class IdeaProvider extends ChangeNotifier{
  List<Idea> ideas = [];
  List<Idea> myIdeas = [];
  int compare(Idea idea1 , Idea idea2){
    if(idea1.likes > idea2.likes){
      return 1 ;
    }
    if(idea1.likes < idea2.likes){
      return -1 ;
    }
    return 0 ;
  }
  void getIdeas()async{
    ideas = [];
    final snapshotsReference =
    FirebaseFirestore.instance.collection('ideas');
    final snapshot = await snapshotsReference.get();
    snapshot.docs.forEach((element) {
      ideas.add(Idea.fromJson(element.data()));
    });
    ideas.sort(compare);
    notifyListeners();
  }
  void getMyIdeas()async{
    myIdeas = [];
    final snapshotsReference =
    FirebaseFirestore.instance.collection('ideas');
    final snapshot = await snapshotsReference.where('owner' , isEqualTo: FirebaseAuth.instance.currentUser?.uid ).get();
    snapshot.docs.forEach((element) {
      myIdeas.add(Idea.fromJson(element.data()));
    });
    myIdeas.sort(compare);
    notifyListeners();
  }
  void modifyIdea({required String title,required String description})async{
    final ideasReference = await FirebaseFirestore.instance.collection('ideas').where("title", isEqualTo: title).get();
    String ideaReference = ideasReference.docs.first.id;
    await FirebaseFirestore.instance.collection('ideas').doc(ideaReference).update({"description" : description});
    ideas.where((element) => element.title==title).first.description = description;
    myIdeas.where((element) => element.title==title).first.description = description;
    notifyListeners();
  }
  void likeIdea({required String title})async{
    final ideasReference = await FirebaseFirestore.instance.collection('ideas').where("title", isEqualTo: title).get();
    String ideaReference = ideasReference.docs.first.id;
    await FirebaseFirestore.instance.collection('ideas').doc(ideaReference).update({"likes" : ideasReference.docs.first.data()["likes"] + 1});
    ideas.where((element) => element.title==title).first.likes = ideasReference.docs.first.data()["likes"] + 1;
    myIdeas.where((element) => element.title==title).first.likes = ideasReference.docs.first.data()["likes"] + 1;
    ideas.sort(compare);
    myIdeas.sort(compare);
    notifyListeners();
  }
  void addIdea({required String title,required String description}){
    FirebaseFirestore.instance.collection('ideas').add(
      Idea(
          owner: FirebaseAuth.instance.currentUser?.uid ?? "",
          title: title,
          description: description,
          likes: 0
      ).toJson()
    );
  }
  void deleteIdea({required String title})async{
    final ideasReference = await FirebaseFirestore.instance.collection('idea').where("title", isEqualTo: title).get();
    String ideaReference = ideasReference.docs.first.id;
    await FirebaseFirestore.instance.collection('ideas').doc(ideaReference).delete();
  }
  void refresh(){
    getIdeas();
    getMyIdeas();
    notifyListeners();
  }
}