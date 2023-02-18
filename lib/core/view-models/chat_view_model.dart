import 'package:chat_for_peace/core/models/chat_model.dart';
import 'package:chat_for_peace/core/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:chat_for_peace/core/models/user-model.dart';
import 'package:chat_for_peace/core/view-models/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  List<Map<int, String>> chat = [];
  String chatId = "";
  bool chatIsStarted = false;
  UserProvider userProvider = UserProvider();
  void searchByCriteria(
      {required String criteria, required bool chatAsSpecialist}) async {
    UserModel currentUser = await userProvider
        .getUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    final chatsReference = await FirebaseFirestore.instance
        .collection('chats')
        .where("firstUserCriteria", isEqualTo: criteria)
        .where('secondUserId', isEqualTo: "")
        .where('secondUserCriteria',
            isEqualTo: currentUser.showcriteria(asSpecialist: chatAsSpecialist))
        .get();
    final desiredChatId =
        chatsReference.docs.isEmpty ? null : chatsReference.docs.first.id;
    if (desiredChatId != null) {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(desiredChatId)
          .update({"secondUserId": FirebaseAuth.instance.currentUser?.uid});
      chatId = desiredChatId;
      notifyListeners();
      return;
    }
    FirebaseFirestore.instance
        .collection('chats')
        .doc(chatsReference.docs.length.toString())
        .set(Chat(
                firstUserId: FirebaseAuth.instance.currentUser?.uid ?? "",
                firestUserCriteria:
                    currentUser.showcriteria(asSpecialist: chatAsSpecialist),
                secondUserCriteria: criteria)
            .toJson());
    chatId = chatsReference.docs.length.toString();
    notifyListeners();
  }

  void sendMessage(String message) async {
    final chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);
    final doc = await chatReference.get() as Map<String, dynamic>;
    List<Message> messages = doc["messages"];
    messages.add(Message(
        id: FirebaseAuth.instance.currentUser?.uid == doc["firstUserId"]
            ? 1
            : 2,
        text: message));
    chatReference.update({"messages": messages});
  }

  void startGettingMessages() async {
    final chatReference =
        FirebaseFirestore.instance.collection('chats/$chatId');
    bool isChatCreator =
        ((chatReference.doc() as Map<String, dynamic>)["firstUserId"] ==
            FirebaseAuth.instance.currentUser?.uid);
    final messages = (chatReference.doc() as Map<String, dynamic>)["messages"];
    for (Message message in messages) {
      chat.add({message.getMessageIndex(isChatCreator): message.text});
    }
    notifyListeners();
    chatReference.snapshots().listen((event) {
      final messages =
          (chatReference.doc() as Map<String, dynamic>)["messages"];
      for (Message message in messages) {
        chat.add({message.getMessageIndex(isChatCreator): message.text});
      }
      notifyListeners();
    });
  }

  void startChat({required String criteria, required bool chatAsSpecialist}) async {
    searchByCriteria(criteria: criteria, chatAsSpecialist: chatAsSpecialist);
    final chatReference =
        FirebaseFirestore.instance.collection('chats/$chatId');
    final chat = Chat.fromJson((chatReference.doc() as Map<String, dynamic>));
    if (chat.firstUserId != "" && chat.secondUserId != "") {
      chatIsStarted = true;
      notifyListeners();
    }
    chatReference.snapshots().listen((event) {
      final chat = Chat.fromJson((chatReference.doc() as Map<String, dynamic>));
      if (chat.firstUserId != "" && chat.secondUserId != "") {
        chatIsStarted = true;
        notifyListeners();
      }
      if (chatIsStarted &&
          (chat.firstUserId == "" || chat.secondUserId == "")) {
        chatReference.doc().delete();
        throw Exception('the conversation has end');
      }
    });
    startGettingMessages();
  }

  void endChat() async {
    final chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);
    final chatDoc = await chatReference.get();
    bool isChatCreator = chatDoc.data()!["firstUserId"] ==
        FirebaseAuth.instance.currentUser?.uid;
    await chatReference
        .update({(isChatCreator ? "firstUserId" : "secondUserId"): ""});
  }
}
