class Donation {
  final String category;
  final String description;
   double currentValue;
   final double finalValue;

  Donation({
    required this.category,
    required this.description,
    this.currentValue = 0,
    required this.finalValue,
  });
  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
    description: json['description'],
    category: json['category'],
    currentValue: json['currentValue'],
    finalValue: json['finalValue'],
  );
  Map<String, dynamic> toJson() => {
    'description': description,
    'category': category,
    'currentValue': currentValue,
    'finalValue': finalValue,
  };
}