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
  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
        id: json["id"],
        creator: json["creator"],
        description: json['description'],
        category: json['category'],
        currentValue: json['currentValue'],
        finalValue: json['finalValue'],
      );
  Map<String, dynamic> toJson() => {
        'id': id,
        'creator': creator,
        'description': description,
        'category': category,
        'currentValue': currentValue,
        'finalValue': finalValue,
      };
}
