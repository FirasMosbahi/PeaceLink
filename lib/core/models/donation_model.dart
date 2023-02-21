//This is the class of donation which is used as a collection in firebase fireStore

class Donation {
  String id;
  String creator;
  final String category;
  final String description;
  double currentValue;
  final double finalValue;

  Donation({
    this.id = "",
    this.creator = "",
    required this.category,
    required this.description,
    this.currentValue = 0,
    required this.finalValue,
  });
  //This factory method allows us to create an instance of donation
  // from json received from firestore
  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        id: json["id"],
        creator: json["creator"],
        description: json['description'],
        category: json['category'],
        currentValue: json['currentValue'],
        finalValue: json['finalValue'],
      );
  //This method allows us to transfer an instance of donation to a json
  // that will be stored in firebase
  Map<String, dynamic> toJson() => {
        'id': id,
        'creator': creator,
        'description': description,
        'category': category,
        'currentValue': currentValue,
        'finalValue': finalValue,
      };
}
