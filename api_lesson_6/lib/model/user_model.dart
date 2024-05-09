class UserModel {
  const UserModel({
    required this.name,
    required this.job,
    this.updatedAt,
  });

  final String name;
  final String job;
  final String? updatedAt;

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      job: json['job'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'job': job,
    };
  }
}
