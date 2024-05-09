import 'package:news_app/models/source_model.dart';

class Articles {
  const Articles({
    required this.source,
    required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    required this.publishedAt,
    required this.content,
  });

  final Source source;
  final String? author;
  final String title;
  final String? description;
  final String url;
  final String? urlToImage;
  final String publishedAt;
  final String? content;

  factory Articles.fromMap(Map<String, dynamic> map) {
    return Articles(
      source: Source.fromJson(map['source'] as Map<String, dynamic>),
      author: map['author'] != null ? map['author'] as String : null,
      title: map['title'] as String,
      description:
          map['description'] != null ? map['description'] as String : null,
      url: map['url'] as String,
      urlToImage:
          map['urlToImage'] != null ? map['urlToImage'] as String : null,
      publishedAt: map['publishedAt'] as String,
      content: map['content'] != null ? map['content'] as String : null,
    );
  }
}
