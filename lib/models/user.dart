class UserModel {
  final String id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  final String? name;
  final String? position;
  final int? salary;

  UserModel({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
    this.name,
    this.position,
    this.salary,
  });

  String get fullName {
    if (firstName.isNotEmpty || lastName.isNotEmpty) {
      return "$firstName $lastName".trim();
    }
    return name ?? "";
  }
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? "",
      email: json['email'] ?? "",
      firstName: json['first_name'] ?? "",
      lastName: json['last_name'] ?? "",
      avatar: json['avatar'] ?? "",
      name: json['name'],
    );
  }

  factory UserModel.fromForm({
    required String id,
    required String email,
    required String firstName,
    required String lastName,
    String avatar = '',
    String? position,
    int? salary,
  }) {
    return UserModel(
      id: id,
      email: email,
      firstName: firstName,
      lastName: lastName,
      avatar: avatar,
      position: position,
      salary: salary,
    );
  }

  Map<String, dynamic> toJsonForApi() {
    return {
      "name": "$firstName ${lastName.isNotEmpty ? lastName : ''}".trim(),
      "job": position ?? "",
    };
  }
}
