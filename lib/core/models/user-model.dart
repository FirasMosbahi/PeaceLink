class UserModel {
  final String name;
  final String email;
  final String photoURL;
  final bool isConnected;
  final bool isSpecialist;
  const UserModel({
    required this.name,
    required this.email,
    required this.photoURL,
    required this.isConnected,
    required this.isSpecialist,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        email: json['email'],
        name: json['name'],
        photoURL: json['photoURL'],
        isConnected: json['isConnected'],
        isSpecialist: json['isSpecialist'],
      );

  Map<String, dynamic> toJson() => {
        'email': email,
        'name': name,
        'photoURL': photoURL,
        'isConnected': isConnected,
        'isSpecialist': isSpecialist,
      };
}
