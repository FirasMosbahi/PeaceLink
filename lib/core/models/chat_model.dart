import 'package:chat_for_peace/core/models/message_model.dart';

class Chat {
  final String firstUserId;
  String secondUserId;
  final String criteria;
  List<Message>? messages;
  Chat({
    required this.firstUserId,
    this.secondUserId = "",
    required this.criteria,
    this.messages,
  });
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
      firstUserId: json["firstUserId"],
      secondUserId: json["secondUserId"],
      criteria: json["firstCriteria"],
      messages: json["messages"]);
  Map<String, dynamic> toJson() => {
        "firstUserId": firstUserId,
        "secondUserId": secondUserId,
        "firstCriteria": criteria,
        "messages": messages ?? [],
      };
}
