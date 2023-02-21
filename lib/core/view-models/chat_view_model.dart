import 'dart:async';

import 'package:PeaceLink/core/models/chat_model.dart';
import 'package:PeaceLink/core/models/user_model.dart';
import 'package:PeaceLink/core/view-models/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';


//This class contains all the logic operations related to the chats
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
    QuerySnapshot<Map<String, dynamic>> chatsReference = await FirebaseFirestore
        .instance
        .collection('chats')
        .where("firstUserCriteria", isEqualTo: criteria)
        .where('secondUserId', isEqualTo: "")
        .where('firstUserId',
            isNotEqualTo: FirebaseAuth.instance.currentUser?.uid)
        .where(
          'secondUserCriteria',
          isEqualTo: currentUser.showCriteria(asSpecialist: chatAsSpecialist),
        )
        .get();
    String? desiredChatId =
        chatsReference.docs.isEmpty ? null : chatsReference.docs.first.id;
    if (desiredChatId != null) {
      FirebaseFirestore.instance
          .collection('chats')
          .doc(desiredChatId)
          .update({"secondUserId": FirebaseAuth.instance.currentUser?.uid});
      chatId = desiredChatId;
      return true;
    }
    FirebaseFirestore.instance
        .collection('chats')
        .doc(chatsReference.docs.length.toString())
        .set(
          Chat(
                  firstUserId: FirebaseAuth.instance.currentUser?.uid ?? "",
                  firstUserCriteria:
                      currentUser.showCriteria(asSpecialist: chatAsSpecialist),
                  secondUserCriteria: criteria)
              .toJson(),
        );
    chatId = chatsReference.docs.length.toString();
    return true;
  }

  Future<bool> sendMessage(String message) async {
    try {
      DocumentReference<Map<String, dynamic>> chatReference =
          FirebaseFirestore.instance.collection('chats').doc(chatId);
      DocumentSnapshot<Map<String, dynamic>> doc = await chatReference.get();
      List<dynamic> messages = doc.data()!["messages"] ?? [];
      messages.add(
        {
          (FirebaseAuth.instance.currentUser?.uid == doc.data()!["firstUserId"]
              ? "1"
              : "2"): message
        },
      );
      await chatReference.update({"messages": messages});
    } catch (e) {
      debugPrint(e.toString());
    }
    return true;
  }

  Future<void> startGettingMessages() async {
    DocumentReference<Map<String, dynamic>> chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);

    DocumentSnapshot<Map<String, dynamic>> docData = await chatReference.get();

    bool isChatCreator = (docData.data()!["firstUserId"] ==
        FirebaseAuth.instance.currentUser?.uid);

    if (docData.data()!["messages"] == null) {
      await chatReference.update(
        {"messages": []},
      );
    }

    List<dynamic> messages = docData.data()!["messages"] ?? [];
    for (Map<String, dynamic> message in messages) {
      Map<int, dynamic> msg = {
        getMessageIndex(isChatCreator, int.parse(message.keys.first)):
            message[message.keys.first] ?? ""
      };
      if (chat.where((element) => element == msg).isEmpty) {
        chat.add(
          {
            getMessageIndex(
              isChatCreator,
              int.parse(message.keys.first),
            ): message[message.keys.first] ?? ""
          },
        );
      }
    }
    if (needReload) {
      needReload = false;
      notifyListeners();
    }
    listener = chatReference.snapshots().listen((event) async {
      DocumentSnapshot<Map<String, dynamic>> docData =
          await chatReference.get();
      List<dynamic> messages = docData.data()!["messages"] ?? [];
      Map<int, String> msg = {
        getMessageIndex(isChatCreator, int.parse(messages.last.keys.first)):
            messages.last[messages.last.keys.first].toString()
      };
      chat.add(msg);
      notifyListeners();
    });
  }

  void startChat(
      {required String criteria, required bool chatAsSpecialist}) async {
    searchByCriteria(criteria: criteria, chatAsSpecialist: chatAsSpecialist);
    DocumentReference<Map<String, dynamic>> chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);
    DocumentSnapshot<Map<String, dynamic>> chatDoc = await chatReference.get();
    Chat chat = Chat.fromJson(chatDoc.data() ?? {});
    if (chat.firstUserId != "" && chat.secondUserId != "") {
      chatIsStarted = true;
      startGettingMessages();
      notifyListeners();
    }
  }

  Future<void> endChat() async {
    DocumentReference<Map<String, dynamic>> chatReference =
        FirebaseFirestore.instance.collection('chats').doc(chatId);
    await chatReference.delete();
    listener?.cancel();
    chat = [];
  }
}
