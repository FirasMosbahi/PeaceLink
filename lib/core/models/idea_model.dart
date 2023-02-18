class Idea{
  final String owner;
  String title;
  String description;
  int likes;
  Idea({required this.owner,required this.title,required this.description,required this.likes});
  factory Idea.fromJson(Map<String, dynamic> json) => Idea(
      owner: json["owner"],
      title: json["title"],
      description: json["description"],
      likes: json["likes"],);
  Map<String, dynamic> toJson() => {
    "owner": owner,
    "title": title,
    "description": description,
    "likes" : likes,
  };
}