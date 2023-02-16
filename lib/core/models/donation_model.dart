import 'package:cloud_firestore/cloud_firestore.dart';

class Donation{
  String name;
  double finalValue;
  double currentValue;
  Donation({required this.name,required this.finalValue,this.currentValue = 0});
  factory Donation.fromJson(Map<String, dynamic> json) => Donation(
    name: json['name'],
    finalValue: json['finalValue'],
    currentValue: json['currentValue'],
  );
  factory Donation.fromDataSnapshot(DocumentSnapshot data) => Donation(
      name: data.get('name'),
      finalValue: data.get('finalValue'),
      currentValue: data.get('currentValue'),
  );
  Map<String, dynamic> toJson() => {
    'name': name,
    'finalValue': finalValue,
    'currentValue': currentValue,
  };
}