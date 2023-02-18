import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  String email;
  final int age;
  final bool isSpecialist;
  String showcriteria({required bool asSpecialist}){
    if(isSpecialist && asSpecialist){
      return "specialist";
  }
    if(0>age && age<13){
      return "child";
    }
    if(13<=age && age<=18){
      return "adolescent";
    }
    return "old";
}
  bool respectCriteria(String searchedCriteria){
    if(searchedCriteria == "specialist" && isSpecialist){
        return true;
    }
    if(searchedCriteria == "child" && 0>age && age<13){
        return true;
    }
    if(searchedCriteria == 'adolescent' && 13<=age && age<=18){
      return true;
    }
    if(searchedCriteria == 'old' && age>=18){
      return true;
    }
    if(searchedCriteria == 'random'){
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
