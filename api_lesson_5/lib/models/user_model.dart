class UserModel {
  const UserModel({
    required this.name,
    required this.job,
    this.updatedAt,
  });

  final String name;
  final String job;
  final String? updatedAt;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'name': name,
      'job': job,
    };
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'] as String,
      job: json['job'] as String,
      updatedAt: json['updatedAt'] as String,
    );
  }
}
