class PostModel {
  const PostModel({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  final int userId;
  final int id;
  final String title;
  final String body;

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      body: json['body'] as String,
      id: json['id'] as int,
      title: json['title'] as String,
      userId: json['userId'] as int,
    );
  }
}
