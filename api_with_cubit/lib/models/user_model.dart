class UserModel {
  const UserModel({
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatar,
  });

  final String email;
  final String firstName;
  final String lastName;
  final String avatar;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'email': email,
      'firstName': firstName,
      'lastName': lastName,
      'avatar': avatar,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      email: map['email'] as String,
      firstName: map['first_name'] as String,
      lastName: map['last_name'] as String,
      avatar: map['avatar'] as String,
    );
  }
}
