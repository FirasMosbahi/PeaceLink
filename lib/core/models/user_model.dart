//This is the class of user which is used as a collection in firebase fireStore
class UserModel {
  String name;
  String email;
  int age;
  final bool isSpecialist;
  String showCriteria({required bool asSpecialist}) {
    if (isSpecialist && asSpecialist) {
      return "specialist";
    }
    if (0 > age && age < 13) {
      return "child";
    }
    if (13 <= age && age <= 18) {
      return "adolescent";
    }
    return "old";
  }

  bool respectCriteria(String searchedCriteria) {
    if (searchedCriteria == "specialist" && isSpecialist) {
      return true;
    }
    if (searchedCriteria == "child" && 0 > age && age < 13) {
      return true;
    }
    if (searchedCriteria == 'adolescent' && 13 <= age && age <= 18) {
      return true;
    }
    if (searchedCriteria == 'old' && age >= 18) {
      return true;
    }
    if (searchedCriteria == 'random') {
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
  //This factory method allows us to create an instance of user
  // from json received from firestore
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        isSpecialist: json['isSpecialist'],
        age: json['age'],
      );
  //This method allows us to transfer an instance of user to a json
  // that will be stored in firebase
  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'isSpecialist': isSpecialist,
        'age': age,
      };
}
