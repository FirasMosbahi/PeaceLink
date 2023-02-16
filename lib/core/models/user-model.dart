import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String name;
  final String email;
  final bool isConnected;
  final bool isSpecialist;
  const UserModel({
    required this.name,
    required this.email,
    required this.isConnected,
    required this.isSpecialist,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        isConnected: json['isConnected'],
        isSpecialist: json['isSpecialist'],
      );
  factory UserModel.fromDataSnapshot(DocumentSnapshot data) => UserModel(
        name: data.get('name'),
        email: data.get('email'),
        isConnected: data.get('isConnected'),
        isSpecialist: data.get('isSpecialist'),
      );
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'isConnected': isConnected,
        'isSpecialist': isSpecialist,
      };
}
