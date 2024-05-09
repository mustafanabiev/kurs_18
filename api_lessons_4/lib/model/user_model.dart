class UserModel {
  const UserModel({
    required this.name,
    required this.job,
    required this.id,
    required this.createdAt,
  });

  final String name;
  final String job;
  final String id;
  final String createdAt;

  factory UserModel.fromJson(Map<String, dynamic> map) {
    return UserModel(
      name: map['name'] as String,
      job: map['job'] as String,
      id: map['id'] as String,
      createdAt: map['createdAt'] as String,
    );
  }
}
