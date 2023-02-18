import 'package:chat_for_peace/core/models/chat_model.dart';
import 'package:chat_for_peace/core/models/message_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:chat_for_peace/core/models/user-model.dart';
import 'package:chat_for_peace/core/view-models/user_view_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class ChatProvider extends ChangeNotifier{
  List<Map<int,String>> chat = [];
  String chatId = "";
  UserProvider userProvider = UserProvider();
  void searchByCriteria({required String criteria})async{
    UserModel currentUser = await userProvider.getUser(FirebaseAuth.instance.currentUser?.uid ?? "");
    final chatsReference = await FirebaseFirestore.instance.collection('chats').get();
    chatsReference.docs.forEach((element) async {
      if(currentUser.respectCriteria(element.data()["criteria"])){
        Chat chat = Chat.fromJson(element.data());
        final firstUser = await userProvider.getUser(chat.firstUserId);
        if(firstUser.respectCriteria(criteria)){
          FirebaseFirestore.instance.collection('chats').doc(element.id).update({"secondUser" : FirebaseAuth.instance.currentUser?.uid});
          chatId = element.id;
          return;
        }
      }
    });
    FirebaseFirestore.instance.collection('chats').doc(chatsReference.docs.length.toString()).set(
      Chat(firstUserId: FirebaseAuth.instance.currentUser?.uid ?? "", criteria: criteria).toJson()
    );
    chatId = chatsReference.docs.length.toString();
  }
  void sendMessage(String message)async{
    final chatReference = FirebaseFirestore.instance.collection('chats').doc(chatId);
    final doc = await chatReference.get() as Map<String,dynamic>;
    List<Message> messages = doc["messages"];
    messages.add(Message(id: FirebaseAuth.instance.currentUser?.uid==doc["firstUser"] ? 1 : 2, text: message));
    chatReference.update({"messages" : messages});
  }
  void startGettingMessages()async{
    final chatReference = FirebaseFirestore.instance.collection('chats/$chatId');
    bool isChatCreator = ((chatReference.doc() as Map<String,dynamic>)["firstUser"] == FirebaseAuth.instance.currentUser?.uid);
    final messages = (chatReference.doc() as Map<String,dynamic>)["messages"];
    for(Message message in messages){
      chat.add({message.getMessageIndex(isChatCreator) : message.text});
    }
    notifyListeners();
    chatReference.snapshots().listen((event){
      final messages = (chatReference.doc() as Map<String,dynamic>)["messages"];
      for(Message message in messages){
        chat.add({message.getMessageIndex(isChatCreator) : message.text});
      }
      notifyListeners();
    });
  }
}