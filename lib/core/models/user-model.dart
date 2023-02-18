import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  final int age;
  final bool isSpecialist;
  bool respectCriteria(String criteria){
    if(criteria == "specialist" && isSpecialist){
        return true;
    }
    if(criteria == "child" && 0>age && age<13){
        return true;
    }
    if(criteria == 'adolescent' && 13<=age && age<=18){
      return true;
    }
    if(criteria == 'old' && age>=18){
      return true;
    }
    if(criteria == 'random'){
      return true;
    }
    return false;
  }
  UserModel({
    required this.name,
    required this.email,
    required this.isSpecialist,
    required this.age,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        isSpecialist: json['isSpecialist'],
        age: json['age'],
      );
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'isSpecialist': isSpecialist,
        'age': age,
      };
}
