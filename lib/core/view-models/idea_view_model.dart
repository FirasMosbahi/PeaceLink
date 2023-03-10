import 'package:PeaceLink/core/models/idea_model.dart';
import 'package:PeaceLink/core/models/user_model.dart';
import 'package:PeaceLink/core/view-models/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

//This class contains all the logic operations related to the ideas
class IdeaProvider extends ChangeNotifier {
  List<Idea> ideas = [];
  List<Idea> myIdeas = [];
  bool hasLoaded = false;
  int compare(Idea idea1, Idea idea2) {
    if (idea1.likes > idea2.likes) {
      return -1;
    }
    if (idea1.likes < idea2.likes) {
      return 1;
    }
    return 0;
  }

  Future<bool> getIdeas() async {
    CollectionReference<Map<String, dynamic>> snapshotsReference =
        FirebaseFirestore.instance.collection('ideas');
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await snapshotsReference.get();
    snapshot.docs.forEach((element) {
      try {
        if (ideas
            .where((data) => element.data()["title"] == data.title)
            .isEmpty) {
          ideas.add(Idea.fromJson(element.data()));
        }
      } catch (e) {
      }
    });
    ideas.sort(compare);
    if (!hasLoaded) {
      hasLoaded = true;
      notifyListeners();
    }
    return true;
  }

  Future<bool> getMyIdeas() async {
    CollectionReference<Map<String, dynamic>> snapshotsReference =
        FirebaseFirestore.instance.collection('ideas');
    QuerySnapshot<Map<String, dynamic>> snapshot =
        await snapshotsReference.get();
    snapshot.docs.forEach((element) {
      if (myIdeas
              .where((data) => element.data()["title"] == data.title)
              .isEmpty &&
          element.data()['id'] == FirebaseAuth.instance.currentUser?.uid) {
        myIdeas.add(
          Idea.fromJson(
            element.data(),
          ),
        );
      }
    });
    myIdeas.sort(compare);
    if (!hasLoaded) {
      hasLoaded = true;
      notifyListeners();
    }
    return true;
  }

  void cleanIdeas() {
    ideas = [];
    hasLoaded = false;
  }

  Future<bool> likeIdea({required String title}) async {
    hasLoaded = false;
    QuerySnapshot<Map<String, dynamic>> ideasReference = await FirebaseFirestore
        .instance
        .collection('ideas')
        .where("title", isEqualTo: title)
        .get();
    String ideaReference = ideasReference.docs.first.id;
    await FirebaseFirestore.instance
        .collection('ideas')
        .doc(ideaReference)
        .update({"likes": ideasReference.docs.first.data()["likes"] + 1});
    ideas.where((element) => element.title == title).first.likes =
        ideasReference.docs.first.data()["likes"] + 1;
    ideas.sort(compare);
    await getMyIdeas();
    await getIdeas();
    return true;
  }

  Future<bool> addIdea(
      {required String title, required String description}) async {
    UserModel user = await UserProvider()
        .getUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    if (ideas.where((element) => element.title == title).isNotEmpty) {
      throw Exception("Each of your ideas should have an unique value");
      //TODO: handle this exception
    }
    await FirebaseFirestore.instance
        .collection('ideas')
        .doc('${FirebaseAuth.instance.currentUser?.uid},$title')
        .set(Idea(
                id: FirebaseAuth.instance.currentUser?.uid ?? "",
                owner: user.name,
                title: title,
                description: description,
                likes: 0)
            .toJson());
    ideas = [];
    myIdeas = [];
    await getIdeas();
    await getMyIdeas();
    return true;
  }

  Future<bool> deleteIdea({required String title}) async {
    await FirebaseFirestore.instance
        .collection('ideas')
        .doc('${FirebaseAuth.instance.currentUser?.uid},$title')
        .delete();
    myIdeas.removeWhere((element) => element.title == title);
    ideas.removeWhere((element) => element.title == title);
    notifyListeners();
    return true;
  }
}
