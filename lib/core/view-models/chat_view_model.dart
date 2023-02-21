import 'dart:async';

import 'package:PeaceLink/core/models/chat_model.dart';
import 'package:PeaceLink/core/models/user-model.dart';
import 'package:PeaceLink/core/view-models/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier {
  List<Map<int, String>> chat = [];
  String chatId = "";
  bool chatIsStarted = false;
  bool needReload = true;
  StreamSubscription<DocumentSnapshot>? listener;
  UserProvider userProvider = UserProvider();
  int getMessageIndex(bool isChatCreator, int id) {
    if (isChatCreator) {
      if (id == 1) {
        return 1;
      }
      if (id == 2) {
        return 2;
      }
    }
    if (!isChatCreator) {
      if (id == 1) {
        return 2;
      }
      if (id == 2) {
        return 1;
      }
    }
    return 0;
  }

  Future<bool> searchByCriteria(
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
      // notifyListeners();
      return true;
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
    // notifyListeners();
    return true;
  }

  Future<bool> sendMessage(String message) async {
    try {
      final chatReference =
          FirebaseFirestore.instance.collection('chats').doc(chatId);
      final doc = await chatReference.get();
      List<dynamic> messages = doc.data()!["messages"] ?? [];
      messages.add({
        (FirebaseAuth.instance.currentUser?.uid == doc.data()!["firstUserId"]
            ? "1"
            : "2"): message
      });
      print(messages);
      await chatReference.update({"messages": messages});
    } catch (e) {
      print(e.toString());
    }
    return true;
  }

  Future<void> startGettingMessages() async {
    final chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);

    final docData = await chatReference.get();

    bool isChatCreator = (docData.data()!["firstUserId"] ==
        FirebaseAuth.instance.currentUser?.uid);

    if (docData.data()!["messages"] == null) {
      await chatReference.update({"messages": []});
    }

    List<dynamic> messages = docData.data()!["messages"] ?? [];
    for (Map<String, dynamic> message in messages) {
      final msg = {
        getMessageIndex(isChatCreator, int.parse(message.keys.first)):
            message[message.keys.first] ?? ""
      };
      if (chat.where((element) => element == msg).isEmpty) {
        chat.add({
          getMessageIndex(isChatCreator, int.parse(message.keys.first)):
              message[message.keys.first] ?? ""
        });
      }
    }
    if (needReload) {
      needReload = false;
      notifyListeners();
    }
    listener = chatReference.snapshots().listen((event) async {
      final docData = await chatReference.get();
      List<dynamic> messages = docData.data()!["messages"] ?? [];
      print(messages.length);
      final msg = {
        getMessageIndex(isChatCreator, int.parse(messages.last.keys.first)):
            messages.last[messages.last.keys.first].toString() ?? ""
      };
      chat.add(msg);
      notifyListeners();
    });
  }

  void startChat(
      {required String criteria, required bool chatAsSpecialist}) async {
    searchByCriteria(criteria: criteria, chatAsSpecialist: chatAsSpecialist);
    final chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);
    final chatDoc = await chatReference.get();
    final chat = Chat.fromJson(chatDoc.data() ?? {});
    if (chat.firstUserId != "" && chat.secondUserId != "") {
      chatIsStarted = true;
      startGettingMessages();
      notifyListeners();
    }
    // StreamSubscription<DocumentSnapshot> listener2 = chatReference.snapshots().listen((event) async {
    //   final chatDoc = await chatReference.get();
    //   final chat = Chat.fromJson(chatDoc.data() ?? {});
    //   if (chat.firstUserId != "" && chat.secondUserId != "") {
    //     chatIsStarted = true;
    //     notifyListeners();
    //   }
    //   if (chatIsStarted &&
    //       (chat.firstUserId == "" || chat.secondUserId == "")) {
    //     chatReference.delete();
    //     throw Exception('the conversation has end');
    //   }
    // });
  }

  Future<void> endChat() async {
    final chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);
    final chatDoc = await chatReference.get();
    bool isChatCreator = chatDoc.data()!["firstUserId"] ==
        FirebaseAuth.instance.currentUser?.uid;
    await chatReference.delete();
    listener?.cancel();
    chat = [];
  }
}
