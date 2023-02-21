class Chat {
  final String firstUserId;
  String secondUserId;
  final String firestUserCriteria;
  final String secondUserCriteria;
  List<Map<int, String>>? messages;
  Chat({
    required this.firstUserId,
    this.secondUserId = "",
    required this.firestUserCriteria,
    required this.secondUserCriteria,
    this.messages,
  });
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
      firstUserId: json["firstUserId"],
      secondUserId: json["secondUserId"],
      firestUserCriteria: json["firstUserCriteria"],
      secondUserCriteria: json["secondUserCriteria"],
      messages: json["messages"]);
  Map<String, dynamic> toJson() => {
        "firstUserId": firstUserId,
        "secondUserId": secondUserId,
        "firstUserCriteria": firestUserCriteria,
        "secondUserCriteria": secondUserCriteria,
        "messages": messages,
      };
}
