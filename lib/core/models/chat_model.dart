//This is the class of chat which is used as a collection in firebase fireStore

class Chat {
  final String firstUserId;
  String secondUserId;
  final String firstUserCriteria;
  final String secondUserCriteria;
  List<Map<int, String>>? messages;
  Chat({
    required this.firstUserId,
    this.secondUserId = "",
    required this.firstUserCriteria,
    required this.secondUserCriteria,
    this.messages,
  });
  //This factory method allows us to create an instance of chat
  // from json received from firestore
  factory Chat.fromJson(Map<String, dynamic> json) => Chat(
      firstUserId: json["firstUserId"],
      secondUserId: json["secondUserId"],
      firstUserCriteria: json["firstUserCriteria"],
      secondUserCriteria: json["secondUserCriteria"],
      messages: json["messages"]);
  //This method allows us to transfer an instance of Chat to a json
  // that will be stored in firebase
  Map<String, dynamic> toJson() => {
        "firstUserId": firstUserId,
        "secondUserId": secondUserId,
        "firstUserCriteria": firstUserCriteria,
        "secondUserCriteria": secondUserCriteria,
        "messages": messages,
      };
}
