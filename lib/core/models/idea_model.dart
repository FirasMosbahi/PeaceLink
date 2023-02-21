//This is the class of idea which is used as a collection in firebase fireStore

class Idea {
  final String id;
  final String owner;
  String title;
  String description;
  int likes;
  Idea(
      {this.id = "",
      required this.owner,
      required this.title,
      required this.description,
      required this.likes});
  //This factory method allows us to create an instance of idea
  // from json received from firestore
  factory Idea.fromJson(Map<String, dynamic> json) => Idea(
        id: json["id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        likes: json["likes"],
      );
  //This method allows us to transfer an instance of idea to a json
  // that will be stored in firebase
  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "title": title,
        "description": description,
        "likes": likes,
      };
}
