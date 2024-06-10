class TodoModel {
  const TodoModel({
    required this.title,
    required this.description,
    required this.date,
  });

  final String title;
  final String description;
  final String date;

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      title: map['title'] as String,
      description: map['description'] as String,
      date: map['date'] as String,
    );
  }
}
