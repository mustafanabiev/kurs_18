import 'package:news_app/models/articles_model.dart';

class TopHeadlinesModel {
  const TopHeadlinesModel({
    required this.status,
    required this.totalResults,
    required this.articles,
  });

  final String status;
  final int totalResults;
  final List<Articles> articles;

  factory TopHeadlinesModel.fromJson(Map<String, dynamic> map) {
    return TopHeadlinesModel(
      status: map['status'] as String,
      totalResults: map['totalResults'] as int,
      articles: List<Articles>.from(
        (map['articles'] as List<dynamic>).map<Articles>(
          (x) => Articles.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }
}
