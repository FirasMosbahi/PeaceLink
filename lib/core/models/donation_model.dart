class Donation {
  final String name;
  final String description;
   double currentValue;
   final double finalValue;

  Donation({
    required this.name,
    required this.description,
    this.currentValue = 0,
    required this.finalValue,
  });
  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
    description: json['description'],
    name: json['name'],
    currentValue: json['currentValue'],
    finalValue: json['finalValue'],
  );
  Map<String, dynamic> toJson() => {
    'description': description,
    'name': name,
    'currentValue': currentValue,
    'finalValue': finalValue,
  };
}