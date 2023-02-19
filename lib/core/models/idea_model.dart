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
  factory Idea.fromJson(Map<String, dynamic> json) => Idea(
        id: json["id"],
        owner: json["owner"],
        title: json["title"],
        description: json["description"],
        likes: json["likes"],
      );
  Map<String, dynamic> toJson() => {
        "id": id,
        "owner": owner,
        "title": title,
        "description": description,
        "likes": likes,
      };
}
